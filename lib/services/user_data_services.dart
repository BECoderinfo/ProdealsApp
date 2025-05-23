import 'package:pro_deals1/utils/my_variables.dart';

class UserDataStorageServices {
  static dynamic readData({required String key}) {
    return MyVariables.box.read(key);
  }

  static void removeData({required String key}) {
    MyVariables.box.remove(key);
  }

  static dynamic writeData({
    required String key,
    required dynamic data,
  }) {
    return MyVariables.box.write(
      key,
      data,
    );
  }

  static dynamic checkIfExist({required String key}) {
    return MyVariables.box.hasData(key);
  }

  static void clear() {
    MyVariables.box.erase();
  }
}

enum panel { business, user }

class UserStorageDataKeys {
  static const String loggedIn = "isLoggedIn";
  static const String token = "token";
  static const String userData = "userdata";
  static const String uId = "userId";
  static const String name = "userName";
  static const String email = "email";
  static const String phone = "phone";
  static const String isPremium = "is_premium";
  static const String planId = "plan_id";
  static const String isBusiness = "is_business";
  static const String addressId = "address_id";
  static const String imageData = "image_data";
  static const String imageUrl = "image_url";
  static const String cityName = "city";
  static const String favouriteBusiness = "favourite_business";
  static const String reqBusinessId = "request_business_id";
  static const String businessCreateResponse = "business_create_response";
  static const String cPanel = "current_panel";
  static const String businessStoreImageUpload = "store_image_upload";
  static const String isBusinessLogin = "business_login";
  static const String businessId = "business_id";
  static const String businessImage = "business_mainimage";
  static const String businessRatting = "business_averageratting";
  static const String businessName = "business_name";
  static const String businessAddress = "business_address";
  static const String businessTime = "business_time";

  static const String businessRequestAccepted = "business_request_accepted";

  static const String businessRequestSent = "business_request_sent";
}
