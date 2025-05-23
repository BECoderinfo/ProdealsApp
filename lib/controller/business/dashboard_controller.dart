import 'package:pro_deals1/imports.dart';

class BusinessDashboardController extends GetxController {
  RxBool isError = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isChartError = false.obs;
  RxBool isChartLoaded = false.obs;

  Widget buildStatCard(String amount, String title, String imagePath,
      Color color, double width) {
    return Container(
      width: width / 2.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  boxShadow: const [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      blurRadius: 0,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(imagePath),
              ),
            ],
          ),
          const Gap(10),
          Text(
            amount,
            style: GoogleFonts.openSans(
              textStyle: Theme.of(Get.context!).textTheme.bodyMedium,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          const Gap(10),
          Text(
            title,
            style: GoogleFonts.openSans(
              textStyle: Theme.of(Get.context!).textTheme.bodyMedium,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    String bId =
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ??
            "";
    getBusinessDashboardData(bId: bId);
    getAverageRating(bId: bId);
    title.value = titleList.first;
  }

  BusinessDashboardData? dashboardData;

  getBusinessDashboardData({required String bId}) async {
    isLoaded.value = false;
    try {
      var response = await ApiService.getApi(Apis.dashboardApi(bId: bId));

      if (response != null) {
        print("R :: ${response}");
        dashboardData = BusinessDashboardData.fromJson(response['data']);
        isLoaded.value = true;
        getBusinessSalesData(bId: bId);
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

  List<String> titleList = ['Weekly', 'Monthly', 'Yearly'];

  RxList<ChartDataModel> chartDataList = <ChartDataModel>[].obs;
  ChartDataKeyModel? chartDataKeyModel;

  getBusinessSalesData({required String bId}) async {
    isChartLoaded.value = false;
    try {
      var response = await ApiService.getApi(Apis.salesData(
        bId: bId,
        key: title.value.toLowerCase(),
      ));

      if (response != null) {
        if (response is List && response.isNotEmpty) {
          chartDataList.clear();
          response.map((e) {
            if (e['totalOrders'] == null) {
              if (title.value == titleList.first) {
                chartDataList.add(ChartDataModel.dayModelClass(e));
              } else if (title.value == titleList.last) {
                chartDataList.add(ChartDataModel.yearModelClass(e));
              } else {
                chartDataList.add(ChartDataModel.monthModelClass(e));
              }
            }
          }).toList();
          List<int> values = findMinMaxValue();

          chartDataKeyModel = ChartDataKeyModel(
            minOrder: values[2],
            maxOrder: values[3],
            totalOrder: "${response.last['totalOrders']}",
            minRevenue: values[0],
            maxRevenue: values[1],
            totalRevenue: "${response.last['totalRevenue']}",
          );
        }
      }
      isChartLoaded.value = true;
    } catch (error) {
      isChartError.value = true;
      ShowToast.errorSnackbar(
        title: "Error",
        msg: "$error",
      );
    }
  }

  List<int> findMinMaxValue() {
    dynamic minOrders = chartDataList.first.orders;
    dynamic maxOrders = chartDataList.first.orders;
    dynamic minRevenue = chartDataList.first.revenue;
    dynamic maxRevenue = chartDataList.first.revenue;

    for (var entry in chartDataList) {
      if (entry.orders < minOrders) {
        minOrders = entry.orders;
      }
      if (entry.orders > maxOrders) {
        maxOrders = entry.orders;
      }
      if (entry.revenue < minRevenue) {
        minRevenue = entry.revenue;
      }
      if (entry.revenue > maxRevenue) {
        maxRevenue = entry.revenue;
      }
    }

    return [
      getNearestLowerMultipleOf(minRevenue, 50),
      getNearestHigherMultipleOf(maxRevenue, 50),
      getNearestLowerMultipleOf(minOrders, 5),
      getNearestHigherMultipleOf(maxOrders, 5)
    ];
  }

  int getNearestHigherMultipleOf(int value, int multiple) {
    return ((value + getInt(multiple) - 1) ~/ getInt(multiple)) *
        getInt(multiple);
  }

  int getNearestLowerMultipleOf(int value, int multiple) {
    return (value ~/ getInt(multiple)) * getInt(multiple);
  }

  getAverageRating({required String bId}) async {
    try {
      var response = await ApiService.getApi(Apis.businessRatting(bId: bId));
      if (response != null) {
        print("R :: ${response}");
        UserDataStorageServices.writeData(
          key: UserStorageDataKeys.businessRatting,
          data: "${response['averageRating'] ?? "0"}",
        );
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

  int getInt(multiple) {
    if (multiple is double) {
      multiple.toInt();
    }
    return multiple;
  }

  RxString title = "".obs;
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return 'Invalid month';
  }
}

double getStepValue(double minValue, double maxValue, int numberOfDivisions) {
  return ((maxValue - minValue) / numberOfDivisions).ceil().toDouble();
}
