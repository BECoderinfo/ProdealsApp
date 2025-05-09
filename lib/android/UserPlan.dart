import 'package:pro_deals1/controller/user_plan_controller.dart';
import '../imports.dart';

class UserPlan extends StatelessWidget {
  const UserPlan({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionModel subscription = Get.arguments;

    UserPlanController controller =
        Get.put(UserPlanController(subscription: subscription));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Your Plan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.plan.value == null
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹${controller.plan.value?.planCount != null && controller.plan.value?.planCount != 0 ? (controller.plan.value!.planPrice! / controller.plan.value!.planCount!).ceil() : controller.plan.value?.planPrice ?? 0}/${controller.plan.value?.planDuration == "monthly" ? "month" : controller.plan.value?.planDuration ?? "month"}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "₹${controller.plan.value?.planPrice ?? 0}/${(controller.plan.value?.planCount ?? 1)} ${controller.plan.value?.planDuration == "monthly" ? "mon" : controller.plan.value?.planDuration ?? "month"}",
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Plan Title
                              Text(
                                controller.plan.value?.planName ?? "",
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
                                  children: controller
                                          .plan.value?.planDescription
                                          ?.map((desc) {
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
