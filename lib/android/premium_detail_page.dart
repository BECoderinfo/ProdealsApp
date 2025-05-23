import 'package:pro_deals1/model_class/choose_plan_model.dart';
import 'package:pro_deals1/widget/shimmerLoding.dart';

import '../controller/premium_detail_controller.dart';
import '../imports.dart';

class PremiumDetailPage extends StatelessWidget {
  PremiumDetailPage({super.key});

  PlansListModel? plan = Get.arguments;

  @override
  Widget build(BuildContext context) {
    PremiumDetailController controller =
        Get.put(PremiumDetailController(ctx: context, plan: plan!));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Premium Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.primary,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.plan == null
              ? const Center(child: Text("Plan data is not available"))
              : Column(
                  children: [
                    Gap(20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // --- Pricing Display ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "₹${controller.plan.planCount != null && controller.plan.planCount != 0 ? (controller.plan.planPrice! / controller.plan.planCount!).ceil() : controller.plan.planPrice ?? 0}/${controller.plan.planDuration == "monthly" ? "month" : controller.plan.planDuration ?? "month"}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹${controller.plan.planPrice ?? 0}/${(controller.plan.planCount ?? 1)} ${controller.plan.planDuration == "monthly" ? "mon" : controller.plan.planDuration ?? "month"}",
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Plan Title
                          Text(
                            controller.plan.planName ?? "",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Static Plan Description (now static and consistent)
                          const Text(
                            "Enjoy complete access to all features of this plan, including advanced tools, exclusive support, and more.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // --- Dynamic Feature List from planDescription ---
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children:
                                  controller.plan.planDescription?.map((desc) {
                                        return Column(
                                          children: [
                                            FeatureRow(
                                              icon: Icons.check_circle_outline,
                                              text: desc,
                                              bold: "",
                                            ),
                                            const SizedBox(height: 15),
                                          ],
                                        );
                                      }).toList() ??
                                      [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20),
                    GestureDetector(
                      onTap: () => controller.isLoading.value
                          ? null
                          : controller.createSub(),
                      child: ShimmerLoading(
                        isLoading: controller.isLoading.value,
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String bold;
  final String? endText;

  const FeatureRow({
    super.key,
    required this.icon,
    required this.text,
    required this.bold,
    this.endText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.black54, size: 24),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 14),
              children: [
                TextSpan(text: text),
                TextSpan(
                    text: bold,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: endText ?? ''),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
