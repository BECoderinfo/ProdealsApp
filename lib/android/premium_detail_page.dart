import 'package:pro_deals1/model_class/choose_plan_model.dart';

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
        child: Column(
          children: [
            Gap(20),
            Container(
              // width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Prices
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${plan?.planPrice ?? 0}/${plan?.planDuration == "monthly" ? "month" : plan?.planDuration ?? "month"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹1100/year",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Plan title
                  Text(
                    "${plan?.planName ?? ""}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),
                  const Text(
                    "Enjoy complete access to Leafy-Garden Planner features for a full year.",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 25),

                  // Features
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: const [
                        FeatureRow(
                            icon: Icons.auto_fix_high,
                            text:
                                "Create the perfect plan in seconds with the ",
                            bold: "magic wand."),
                        SizedBox(height: 15),
                        FeatureRow(
                            icon: Icons.task_alt,
                            text: "Organize ",
                            bold: "important tasks",
                            endText: " for your garden."),
                        SizedBox(height: 15),
                        FeatureRow(
                            icon: Icons.shopping_cart,
                            text: "Year-round harvest with ",
                            bold: "pre-and post-crops."),
                        SizedBox(height: 15),
                        FeatureRow(
                            icon: Icons.nature,
                            text: "Use proven ",
                            bold: "companion planting plans."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(30),
            Obx(
              () => GestureDetector(
                onTap: controller.isLoading.value
                    ? null
                    : () {
                        controller.createSub();
                      },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    controller.isLoading.value
                        ? "Loading..."
                        : "Start Subscription",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
