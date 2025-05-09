List Cuisines = [
  {
    'image': 'assets/images/Chinese.png',
    'name': 'Chinese',
  },
  {
    'image': 'assets/images/ni_talie.png',
    'name': 'North Indian',
  },
  {
    'image': 'assets/images/si_food.png',
    'name': 'South Indian',
  },
  {
    'image': 'assets/images/Noodels.png',
    'name': 'Noodels',
  },
  {
    'image': 'assets/images/pizza.png',
    'name': 'Pizza',
  },
  {
    'image': 'assets/images/Burger.png',
    'name': 'Burger',
  },
  {
    'image': 'assets/images/Multicuisine.png',
    'name': 'Multicuisine',
  },
];

List Dessert = [
  {
    'image': 'assets/images/Shakes.png',
    'name': 'Shakes',
  },
  {
    'image': 'assets/images/Ice_cream.png',
    'name': 'Ice cream',
  },
  {
    'image': 'assets/images/Cake.png',
    'name': 'Cake',
  },
  {
    'image': 'assets/images/Noodels.png',
    'name': 'Coffee',
  },
  {
    'image': 'assets/images/Tea.png',
    'name': 'Tea',
  },
];

bool isfood = true;

List orders = [
  {
    'image': 'assets/image/image 22.png',
    'name': "Delicious Burger",
    'prize': 30,
    'quantity': 1
  },
  {
    'image': 'assets/image/meat-dish-with-vegetables.jpg',
    'name': "Samosa",
    'prize': 10,
    'quantity': 2
  },
  {
    'image': 'assets/image/image 54 (1).png',
    'name': "Strawberry Cake",
    'prize': 180,
    'quantity': 1
  },
  {
    'image': 'assets/image/image 22.png',
    'name': "Delicious Burger",
    'prize': 10,
    'quantity': 1
  },
];

String id = "";
String UserName = "";
String Email = "";
String Phone = "";
bool isBusiness = false;
var ImageB = "";

// String host = "http://141.148.196.197:3001/";
String host = "http://192.168.1.7:3001/";
// String host = "https://prodeal.onrender.com/";

class Apis {
  static const Duration timeoutDuration = Duration(minutes: 5);
  static const Map<String, String> headersValue = {
    'Content-Type': 'application/json'
  };
  static const String serverAddress = "http://192.168.1.7:3001/";

  // static const String serverAddress = "http://141.148.196.197:3001/";

  /// user apis
  static Uri loginUser = Uri.parse("${serverAddress}users/login");
  static Uri socialLogin = Uri.parse("${serverAddress}users/googleOrIOS");
  static Uri sequreUser = Uri.parse("${serverAddress}users/sequre");
  static Uri registerUser = Uri.parse("${serverAddress}users/register");
  static Uri userVerifyOtp = Uri.parse("${serverAddress}users/verify");
  static Uri getAllCity = Uri.parse("${serverAddress}city/get");
  static Uri getAllPlan = Uri.parse("${serverAddress}memberplan/getActivePlan");
  static Uri getAllBanner = Uri.parse("${serverAddress}banner/getAll");
  static Uri getAllCategory = Uri.parse("${serverAddress}category/getAll");
  static Uri getAllFoodType = Uri.parse("${serverAddress}foodtype/get");

  static Uri getPlanById({required String pId}) =>
      Uri.parse("${serverAddress}memberplan/getPlanById/$pId");

  static Uri userResendOtp({required String email}) =>
      Uri.parse("${serverAddress}users/resendOTP/$email");

  static Uri userForgetPassword({required String email}) =>
      Uri.parse("${serverAddress}users/forget/$email");

  static Uri userResetPassword = Uri.parse("${serverAddress}users/password");

  static Uri userUpdateProfile({required String uId}) =>
      Uri.parse("${serverAddress}users/update/$uId");

  static Uri addressAdd = Uri.parse("${serverAddress}address/add");

  static Uri getAddressById({required String uId}) =>
      Uri.parse("${serverAddress}address/get/$uId");

  static Uri updateAddressById({required String aId}) =>
      Uri.parse("${serverAddress}address/update/$aId");

  static Uri deleteAddressById({required String aId}) =>
      Uri.parse("${serverAddress}address/delete/$aId");

  static Uri getBusinessByCity({required String cityName}) =>
      Uri.parse("${serverAddress}business/getByCity/$cityName");

  static Uri getBusinessByCategory({required String category}) =>
      Uri.parse("${serverAddress}business/getByCategory/$category");

  /// business apis
  static Uri createBusiness = Uri.parse("${serverAddress}business/create");
  static Uri businessRegister = Uri.parse("${serverAddress}business/register");

  static Uri mainImageUpload({required String bId}) =>
      Uri.parse("${serverAddress}business/mainImage/$bId");

  static Uri menuImageUpload({required String bId}) =>
      Uri.parse("${serverAddress}business/menuImage/$bId");

  static Uri storeImageUpload({required String bId}) =>
      Uri.parse("${serverAddress}business/storeImage/$bId");

  static Uri govermentIdImageUpload({required String bId}) =>
      Uri.parse("${serverAddress}business/govermentIdImage/$bId");

  static Uri voterIdImageUpload({required String bId}) =>
      Uri.parse("${serverAddress}business/waterIdImage/$bId");

  static Uri businessDetail({required String bId}) =>
      Uri.parse("${serverAddress}business/get/$bId");

  static Uri businessRatting({required String bId}) =>
      Uri.parse("${serverAddress}rating/average/$bId");

  static Uri updateBusinessById({required String bId}) =>
      Uri.parse("${serverAddress}business/update/$bId");

  static Uri updateBusinessImagesById({required String bId}) =>
      Uri.parse("${serverAddress}business/updateImages/$bId");

  static Uri deleteBusinessImagesById({required String bId}) =>
      Uri.parse("${serverAddress}business/DeleteImage/$bId");

  /// banner apis
  static Uri requestBanner = Uri.parse("${serverAddress}banner/add");

  static Uri viewBanner({required String bId}) =>
      Uri.parse("${serverAddress}banner/getbanners/$bId");

  static Uri updateBannerById({required String bId}) =>
      Uri.parse("${serverAddress}banner/update/$bId");

  static Uri deleteBannerById({required String bId}) =>
      Uri.parse("${serverAddress}banner/delete/$bId");

  /// offer apis
  static Uri getOfferByBusinessId({required String bId}) =>
      Uri.parse("${serverAddress}offer/bussinessGet/$bId");

  static Uri manageOffer({required String oId}) =>
      Uri.parse("${serverAddress}offer/active/$oId");

  static Uri offerRedeemed({required String uId}) =>
      Uri.parse("${serverAddress}offer/redeemed/$uId");

  static Uri deleteOffer({required String oId}) =>
      Uri.parse("${serverAddress}offer/Delete/$oId");

  static Uri updateOffer({required String oId}) =>
      Uri.parse("${serverAddress}offer/Update/$oId");
  static Uri addOffer = Uri.parse("${serverAddress}offer/Create");

  /// user cart apis
  static Uri getCartByUserId({required String uId}) =>
      Uri.parse("${serverAddress}cart/get/$uId");
  static Uri addCart = Uri.parse("${serverAddress}cart/add");

  static Uri deleteCart({required String cartId}) =>
      Uri.parse("${serverAddress}cart/delete/$cartId");

  /// notification apis
  static Uri getAllNotification = Uri.parse("${serverAddress}notification");

  /// promocode apis
  static Uri getAllPromoCode = Uri.parse("${serverAddress}promocode/Getpromo");

  /// order apis
  static Uri createOrder = Uri.parse("${serverAddress}order/create");
  static Uri getTodayOrder = Uri.parse("${serverAddress}order/today");

  static Uri getAllOrder({required String bId}) =>
      Uri.parse("${serverAddress}order/all?businessId=$bId");
  static Uri getPendingOrder = Uri.parse("${serverAddress}order/pending");
  static Uri getAcceptedOrder = Uri.parse("${serverAddress}order/accepted");
  static Uri getCompletedOrder = Uri.parse("${serverAddress}order/completed");

  static Uri acceptOrder({required String oId}) =>
      Uri.parse("${serverAddress}order/accept/${oId}");

  static Uri getOrderDetails({required String oId}) =>
      Uri.parse("${serverAddress}order/get/${oId}");

  static Uri cancelOrder({required String oId}) =>
      Uri.parse("${serverAddress}order/cancel/${oId}");

  static Uri rejectOrder({required String oId}) =>
      Uri.parse("${serverAddress}order/reject/${oId}");

  static Uri completeOrder({required String oId}) =>
      Uri.parse("${serverAddress}order/complete/${oId}");

  static Uri getOrderByUserId({required String uId}) =>
      Uri.parse("${serverAddress}order/getOrderByUId/$uId");

  /// dashboard apis
  static Uri dashboardApi({required String bId}) =>
      Uri.parse("${serverAddress}business/dashboard?id=${bId}");

  static Uri salesData({
    required String bId,
    required String key,
  }) =>
      Uri.parse("${serverAddress}hestory/salesData?businessId=${bId}&key=$key");

  /// Manage menu apis
  static Uri getMenuImages({required String bId}) =>
      Uri.parse("${serverAddress}business/getmenuImg/${bId}");

  /// faq
  static Uri getAllFAQ = Uri.parse("${serverAddress}support/quotations");
  static Uri askQuestion = Uri.parse("${serverAddress}support/quotation");

  // razorpay
  static Uri createSub = Uri.parse("${serverAddress}payment/createSubcription");
  static Uri varifySub = Uri.parse("${serverAddress}payment/verifySignature");
  static Uri cancelSub = Uri.parse("${serverAddress}subscription/cancel");

  static Uri getSubById({required String uId}) =>
      Uri.parse("${serverAddress}subscription/getByUserId/${uId}");

  static Uri createRating = Uri.parse("${serverAddress}rating/add");
}
