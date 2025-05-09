import 'package:pro_deals1/imports.dart';

class BusinessManageProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBusinessData(
        bId: UserDataStorageServices.readData(
              key: UserStorageDataKeys.businessId,
            ) ??
            "");
  }

  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxBool isTapped = false.obs;

  ScrollController s = ScrollController();

  PageController p = PageController();

  Widget summryWidget({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(15),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Gap(5),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget tabMenu({
    required int index,
    required String name,
  }) {
    return GestureDetector(
      onTap: () {
        if (selectedIndex.value == index) return;
        isTapped.value = true;
        if (index == 0 || index == 1) {
          s
              .animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          )
              .then(
            (value) {
              selectedIndex.value = index;
              p
                  .animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              )
                  .then(
                (value) {
                  isTapped.value = false;
                },
              );
            },
          );
        } else {
          s
              .animateTo(
            s.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
          )
              .then(
            (value) {
              selectedIndex.value = index;
              p
                  .animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
              )
                  .then(
                (value) {
                  isTapped.value = false;
                },
              );
            },
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedIndex.value == index
              ? AppColor.primary
              : Colors.transparent,
        ),
        child: Text(
          name,
          style: TextStyle(
            color: AppColor.black,
            fontSize: selectedIndex.value == index ? 15 : 14,
            fontWeight: selectedIndex.value == index
                ? FontWeight.w500
                : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  RxInt selectedIndex = 0.obs;

  BusinessDetailModel? details;

  getBusinessData({required String bId}) async {
    isLoaded.value = false;
    try {
      final response = await ApiService.getApi(
        Apis.businessDetail(bId: bId),
      );

      if (response != null) {
        details = BusinessDetailModel.fromJson(response);

        isLoaded.value = true;
      } else {
        isError.value = true;
      }
    } catch (error) {
      isError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }
}
