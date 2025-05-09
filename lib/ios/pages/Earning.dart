import 'package:flutter/cupertino.dart';
import 'package:pro_deals1/imports.dart';
import '../../widget/cupertino_my_drawer.dart';

class Earning_ios extends GetView<TotalEarningController> {
  const Earning_ios({super.key});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return GetBuilder<TotalEarningController>(
        init: TotalEarningController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                BusinessImage.mainStoreImageWidget(),
                Gap(20),
              ],
            ),
            drawer: C_drawer(hei, wid),
            body: CupertinoPageScaffold(
                child: Container(
              color: AppColor.white,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Container(
                    width: wid,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL EARNING",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Gap(10),
                        Obx(
                          () => controller.isChartLoaded.value
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButton<String>(
                                          value: controller.title.value,
                                          items: <String>[
                                            'Weekly',
                                            'Monthly',
                                            'Yearly'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            if (newValue == null ||
                                                newValue ==
                                                    controller.title.value)
                                              return;
                                            controller.title.value = newValue;
                                            controller.getBusinessSalesData(
                                                bId: UserDataStorageServices
                                                        .readData(
                                                      key: UserStorageDataKeys
                                                          .businessId,
                                                    ) ??
                                                    "");
                                          },
                                        ),
                                      ],
                                    ),
                                    Gap(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total revenue',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '₹ ${controller.chartDataKeyModel?.totalRevenue ?? "0"}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    ColumnChartWidget(
                                      list: controller.chartDataList,
                                      data: controller.chartDataKeyModel,
                                    ),
                                    Gap(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total orders',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${controller.chartDataKeyModel?.totalOrder ?? "0"}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    LineChartWidget(
                                      list: controller.chartDataList,
                                      data: controller.chartDataKeyModel,
                                    ),
                                    Gap(10),
                                  ],
                                )
                              : Container(
                                  height: Get.height * 0.3,
                                  child: CustomCircularIndicator(
                                    color: AppColor.primary,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
          );
        });
  }
}
