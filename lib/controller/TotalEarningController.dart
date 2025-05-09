import 'package:pro_deals1/imports.dart';

class TotalEarningController extends GetxController {
  RxBool isChartError = false.obs;
  RxBool isChartLoaded = false.obs;
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

  int getInt(multiple) {
    if (multiple is double) {
      multiple.toInt();
    }
    return multiple;
  }

  RxString title = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    title.value = titleList.first;
    getBusinessSalesData(
      bId: UserDataStorageServices.readData(
            key: UserStorageDataKeys.businessId,
          ) ??
          "",
    );
  }
}
