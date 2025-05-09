import 'package:pro_deals1/model_class/choose_plan_model.dart';

import '../imports.dart';

class UserPlanController extends GetxController {
  SubscriptionModel subscription;

  UserPlanController({required this.subscription});

  Rx<PlansListModel?> plan = Rx<PlansListModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPlanById();
  }

  void getPlanById() async {
    try {
      isLoading.value = true;
      var res = await ApiService.getApi(
        Apis.getPlanById(pId: subscription.planId ?? ""),
      );
      if (res != null) {
        plan.value = PlansListModel.fromJson(res['data']);
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isLoading.value = false;
    }
  }
}
