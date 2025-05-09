import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/android/QR.dart';
import 'package:pro_deals1/android/map.dart';
import 'package:pro_deals1/android/offer.dart';
import 'package:pro_deals1/controller/verify_premium_controller.dart';
import 'package:pro_deals1/ios/iosNotification.dart';

import 'package:pro_deals1/ios/promocode_details.dart';

import 'android/UserPlan.dart';
import 'android/premium_detail_page.dart';
import 'imports.dart';
import 'ios/pages/overview.dart';
import 'splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  String Data =
      UserDataStorageServices.readData(key: UserStorageDataKeys.userData) ?? "";
  if (Data.isNotEmpty) {
    id = UserDataStorageServices.readData(key: UserStorageDataKeys.uId) ?? "";
    UserName =
        UserDataStorageServices.readData(key: UserStorageDataKeys.name) ?? "";
    Email =
        UserDataStorageServices.readData(key: UserStorageDataKeys.email) ?? "";
    Phone =
        UserDataStorageServices.readData(key: UserStorageDataKeys.phone) ?? "";
    isBusiness =
        UserDataStorageServices.readData(key: UserStorageDataKeys.isBusiness) ??
            false;
  }

  VerifyPremiumController ver = VerifyPremiumController();

  ver.VerifyPremium();

  runApp(ProDeals());
}

class ProDeals extends StatelessWidget {
  ProDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return _iosApp();
    if (Platform.isIOS) {
      return _iosApp();
    } else {
      return _androidApp();
    }
  }

  Widget _iosApp() {
    return GetCupertinoApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 650),
      title: "Pro Deals",
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const splash(),
        ),
        GetPage(
          name: '/detail_image_view',
          page: () => const DetailImageView(),
        ),
        GetPage(
          name: '/promocode',
          page: () => const promocode(),
        ),
        GetPage(
          name: '/promocodeDetails',
          page: () => const promocode_details(),
        ),
        GetPage(
          name: '/ios_home',
          page: () => const ios_home(),
        ),
        GetPage(
          name: '/intro',
          page: () => const ios_intro(),
        ),
        GetPage(
          name: '/login',
          page: () => ios_login(),
        ),
        GetPage(
          name: '/ios_sign_up',
          page: () => ios_sign_up(),
        ),
        GetPage(
          name: '/forgot',
          page: () => const IosForgotPass(),
        ),
        GetPage(
          name: '/otp_verification',
          page: () => ios_otp(),
        ),
        GetPage(
          name: '/confirm',
          page: () => const confirm(),
        ),
        GetPage(
          name: '/ios_profile',
          page: () => const IosProfile(),
        ),
        GetPage(
          name: '/navigation',
          page: () => const ios_navigation(),
        ),
        GetPage(
          name: '/ios_filter',
          page: () => const ios_filter(),
        ),
        GetPage(
          name: '/ios_category',
          page: () => const ios_category(),
        ),
        GetPage(
          name: '/locationios',
          page: () => const locationios(),
        ),
        GetPage(
          name: '/ios_restaurants',
          page: () => const ios_restaurants(),
        ),
        GetPage(
          name: '/restaurant_details',
          page: () => const RestaurantDetails(),
        ),
        GetPage(
          name: '/product_details',
          page: () => const FoodDetails(),
        ),
        GetPage(
          name: '/ios_promocode',
          page: () => const promocode(),
        ),
        GetPage(
          name: '/ios_favourite',
          page: () => const iosFavourite(),
        ),
        GetPage(
          name: '/edit_profile',
          page: () => const ios_edit_profile(),
        ),
        GetPage(
          name: '/ios_cart',
          page: () => const ios_cart(),
        ),
        GetPage(
          name: '/ios_support',
          page: () => const ios_support(),
        ),
        GetPage(
          name: '/ios_Ans',
          page: () => const ios_Ans(),
        ),
        GetPage(
          name: '/ios_qr',
          page: () => const ios_qr(),
        ),
        GetPage(
          name: '/ios_scan_qr',
          page: () => const ios_scan_qr(),
        ),
        GetPage(
          name: '/ios_address',
          page: () => const ios_Address(),
        ),
        GetPage(
          name: '/ios_add_address',
          page: () => const ios_add_address(),
        ),
        GetPage(
          name: '/ios_create_account',
          page: () => ios_create_account(),
        ),
        GetPage(
          name: '/ios_business_address',
          page: () => ios_address(),
        ),
        GetPage(
          name: '/ios_detail',
          page: () => ios_detail(),
        ),
        GetPage(
          name: '/ios_notification',
          page: () => iosNotification(),
        ),
        GetPage(
          name: '/ios_businessProfile',
          page: () => const ios_businessProfile(),
        ),
        GetPage(
          name: '/ios_images',
          page: () => const ios_images(),
        ),
        GetPage(
          name: '/ios_verify',
          page: () => const ios_verify(),
        ),
        GetPage(
          name: '/ios_successfully',
          page: () => const ios_successfully(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const dashboard(),
        ),
        GetPage(
          name: '/ios_about_us',
          page: () => const ios_about_us(),
        ),
        GetPage(
          name: '/privacy_policy',
          page: () => const privacy_policy(),
        ),
        GetPage(
          name: '/term_condition',
          page: () => const term_conditiom(),
        ),
        GetPage(
          name: '/ios_active',
          page: () => const IosActive(),
        ),
        GetPage(
          name: '/Manage_offer',
          page: () => const ios_manageoffer(),
        ),
        GetPage(
          name: '/order',
          page: () => order(),
        ),
        GetPage(
          name: '/overview_ios',
          page: () => const overview_ios(),
        ),
        GetPage(
          name: '/Earning_ios',
          page: () => const Earning_ios(),
        ),
        GetPage(
          name: '/user_order_history',
          page: () => iosUserOrderHistoryScreen(),
        ),
        GetPage(
          name: '/user_order_detail',
          page: () => iosUserOrderDetailScreen(),
        ),
        GetPage(
          name: '/settings_screen',
          page: () => iosSettingScreen(),
        ),
        GetPage(
          name: '/reset_password',
          page: () => IOSResetPasswordScreen(),
        ),
        GetPage(
          name: '/business_order_detail',
          page: () => iosBusinessOrderDetailsScreen(),
        ),
        GetPage(
          name: '/total_redeemed',
          page: () => const total_redeemed(),
        ),
        GetPage(
          name: '/Manage_banner',
          page: () => const ManageBannerScreen(),
        ),
        GetPage(
          name: '/business_manage_profile',
          page: () => iosBusinessManageProfile(),
        ),
        GetPage(
          name: '/Manage_menu',
          page: () => const iosManageMenuScreen(),
        ),
        GetPage(
          name: '/add_update_offer',
          page: () => iosAddUpdateOfferScreen(),
        ),
        GetPage(
          name: '/category_detail_screen',
          page: () => IOSCategoryDetailScreen(),
        ),
        GetPage(
          name: '/ios_redeemed_offers',
          page: () => const ios_redeemed_offers(),
        ),
        GetPage(
          name: '/Premium',
          page: () => const premium_page(),
        ),
        GetPage(
          name: '/PremiumDetails',
          page: () => PremiumDetailPage(),
        ),
        GetPage(
          name: '/userPlan',
          page: () => const UserPlan(),
        ),
      ],
    );
  }

  Widget _androidApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pro Deals",
      // initialRoute: '/PremiumDetails',
      initialRoute: '/',
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => const splash(),
        ),
        GetPage(
          name: '/detail_image_view',
          page: () => const DetailImageView(),
        ),
        GetPage(
          name: '/intro',
          page: () => const Intro(),
        ),
        GetPage(
          name: '/login',
          page: () => login(),
        ),
        GetPage(
          name: '/register',
          page: () => register(),
        ),
        GetPage(
          name: '/forgot',
          page: () => const forgot_pass(),
        ),
        GetPage(
          name: '/otp_verification',
          page: () => otp_verification(),
        ),
        GetPage(
          name: '/navigation',
          page: () => const navigation(),
        ),
        GetPage(
          name: '/home',
          page: () => const home_page(),
        ),
        GetPage(
          name: '/Categories',
          page: () => const categories(),
        ),
        GetPage(
          name: '/cart',
          page: () => const Cart(),
        ),
        GetPage(
          name: '/Premium',
          page: () => const premium_page(),
        ),
        GetPage(
          name: '/PremiumDetails',
          page: () => PremiumDetailPage(),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),
        ),
        GetPage(
          name: '/edit_profile',
          page: () => const EditProfile(),
        ),
        GetPage(
          name: '/Search',
          page: () => const SearchPage(),
        ),
        GetPage(
          name: '/shopPage',
          page: () => const shope_page(),
        ),
        GetPage(
          name: '/detailPage',
          page: () => const DetailsPage(),
        ),
        GetPage(
          name: '/Filter',
          page: () => const FilterPage(),
        ),
        GetPage(
          name: '/myFavourite',
          page: () => const Favourite(),
        ),
        GetPage(
          name: '/qr_scanner',
          page: () => const QrScanner(),
        ),
        GetPage(
          name: '/AddAddress',
          page: () => const AddAddress(),
        ),
        GetPage(
          name: '/DeliveryAddress',
          page: () => const DeliveryAddress(),
        ),
        GetPage(
          name: '/earning',
          page: () => const TotalEarning(),
        ),
        GetPage(
          name: '/verify',
          page: () => const verify(),
        ),
        GetPage(
          name: '/QRcode',
          page: () => const QRcode(),
        ),
        GetPage(
          name: '/Coupons',
          page: () => Coupons(),
        ),
        GetPage(
          name: '/Profession_Profile',
          page: () => const Profession_Profile(),
        ),
        GetPage(
          name: '/Profession_details',
          page: () => const Profession_details(),
        ),
        GetPage(
          name: '/and_restaurant_details',
          page: () => const AndroidBusinessDetails(),
        ),
        GetPage(
          name: '/Business_address',
          page: () => B_Address(),
        ),
        GetPage(
          name: '/business_manage_profile',
          page: () => BusinessManageProfile(),
        ),
        GetPage(
          name: '/edit_business_profile',
          page: () => EditBusinessProfile(),
        ),
        GetPage(
          name: '/create_business',
          page: () => create_business(),
        ),
        GetPage(
          name: '/upload_store',
          page: () => const UploadStore(),
        ),
        GetPage(
          name: '/Manage_offer',
          page: () => const Manage_offer(),
        ),
        GetPage(
          name: '/Manage_menu',
          page: () => const ManageMenuScreen(),
        ),
        GetPage(
          name: '/Manage_banner',
          page: () => const ManageBannerScreen(),
        ),
        GetPage(
          name: '/order_dashboard',
          page: () => TotalOrdersScreen(),
        ),
        GetPage(
          name: '/business_order_detail',
          page: () => BusinessOrderDetailsScreen(),
        ),
        GetPage(
          name: '/total_redeemed',
          page: () => const total_redeemed(),
        ),
        GetPage(
          name: '/support_details',
          page: () => const support_details(),
        ),
        GetPage(
          name: '/support',
          page: () => const support(),
        ),
        GetPage(
          name: '/notification',
          page: () => const NotificationScreen(),
        ),
        GetPage(
          name: '/Privacy_policy',
          page: () => const Privacy_Policy(),
        ),
        GetPage(
          name: '/Term_condition',
          page: () => const Term_condition(),
        ),
        GetPage(
          name: '/About_Us',
          page: () => const About_Us(),
        ),
        GetPage(
          name: '/successfully',
          page: () => const successfully(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
        ),
        GetPage(
          name: '/Active_offers',
          page: () => Active_offers(),
        ),
        GetPage(
          name: '/location',
          page: () => const location(),
        ),
        GetPage(
          name: '/overview',
          page: () => overview(),
        ),
        GetPage(
          name: '/offer',
          page: () => OffersPage(),
        ),
        GetPage(
          name: '/add_update_offer',
          page: () => AddUpdateOfferScreen(),
        ),
        GetPage(
          name: '/and_user_order_history',
          page: () => UserOrderHistoryScreen(),
        ),
        GetPage(
          name: '/and_user_order_detail',
          page: () => UserOrderDetailScreen(),
        ),
        GetPage(
          name: '/reset_password',
          page: () => ResetPasswordScreen(),
        ),
        GetPage(
          name: '/settings_screen',
          page: () => SettingScreen(),
        ),
        GetPage(
          name: '/category_detail_screen',
          page: () => CategoryDetailScreen(),
        ),
        GetPage(
          name: '/redeemed_offers',
          page: () => const RedeemedOffers(),
        ),
        GetPage(
          name: '/userPlan',
          page: () => const UserPlan(),
        ),
      ],
    );
  }
}
