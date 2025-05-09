import '../imports.dart';

class VerifyPremiumController extends GetxController {
  SubscriptionModel? subscription;

  void VerifyPremium() async {
    if (UserDataStorageServices.readData(key: UserStorageDataKeys.loggedIn)) {
      var res = await ApiService.getApi(Apis.getSubById(
          uId: UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ??
              ""));

      if (res != null) {
        subscription = SubscriptionModel.fromJson(res);
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.isPremium,
          data: subscription?.isActive ?? false,
        );
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.planId,
          data: subscription?.planId ?? "",
        );
      } else {
        subscription = null;
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.isPremium,
          data: false,
        );
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.planId,
          data: "",
        );
      }
    }
  }
}
