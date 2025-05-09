import 'package:pro_deals1/widget/cupertino_my_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../imports.dart';

class dashboard extends GetView<BusinessDashboardController> {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color2 = const Color(0xFFFCE5AC);
    final double wid = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          BusinessImage.mainStoreImageWidget(),
          const Gap(16),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      drawer: C_drawer(height, wid),
      body: GetBuilder<BusinessDashboardController>(
          init: BusinessDashboardController(),
          builder: (dashboardController) {
            return Obx(
              () => dashboardController.isError.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 80,
                        ),
                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(20),
                            Expanded(
                              child: Text(
                                "Something went wrong please try again.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Gap(20),
                          ],
                        ),
                      ],
                    )
                  : !dashboardController.isLoaded.value
                      ? CustomCircularIndicator(color: AppColor.primary)
                      : Padding(
                          padding: const EdgeInsets.all(16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(20),
                                Text(
                                  'MY DASHBOARD',
                                  style: GoogleFonts.openSans(
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                const Gap(20),
                                Center(
                                  child: Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      dashboardController.buildStatCard(
                                          '₹ ${dashboardController.dashboardData?.totalEarning ?? 0}',
                                          'Total Earning',
                                          'assets/images/Received.png',
                                          color2,
                                          wid),
                                      dashboardController.buildStatCard(
                                          '${dashboardController.dashboardData?.totalOrders ?? 0}',
                                          'Total Orders',
                                          'assets/images/list.png',
                                          color2,
                                          wid),
                                      dashboardController.buildStatCard(
                                          '${dashboardController.dashboardData?.reedemedPromocode ?? 0}',
                                          'Total Redeemed',
                                          'assets/images/gift_voucher.png',
                                          color2,
                                          wid),
                                      dashboardController.buildStatCard(
                                          '${dashboardController.dashboardData?.activeOffers ?? 0}',
                                          'Active Offers',
                                          'assets/images/Active_offer.png',
                                          color2,
                                          wid),
                                    ],
                                  ),
                                ),
                                const Gap(20),
                                Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => controller.isChartLoaded.value
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      DropdownButton<String>(
                                                        value: controller
                                                            .title.value,
                                                        items: <String>[
                                                          'Weekly',
                                                          'Monthly',
                                                          'Yearly'
                                                        ].map((String value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                        onChanged:
                                                            (String? newValue) {
                                                          if (newValue ==
                                                                  null ||
                                                              newValue ==
                                                                  controller
                                                                      .title
                                                                      .value)
                                                            return;
                                                          controller.title
                                                              .value = newValue;
                                                          controller
                                                              .getBusinessSalesData(
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
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total revenue',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '₹ ${controller.chartDataKeyModel?.totalRevenue ?? "0"}',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  ColumnChartWidget(
                                                    list: controller
                                                        .chartDataList,
                                                    data: controller
                                                        .chartDataKeyModel,
                                                  ),
                                                  Gap(10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Total orders',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${controller.chartDataKeyModel?.totalOrder ?? "0"}',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  LineChartWidget(
                                                    list: controller
                                                        .chartDataList,
                                                    data: controller
                                                        .chartDataKeyModel,
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
                                const Gap(20),
                              ],
                            ),
                          ),
                        ),
            );
          }),
    );
  }
}

class RevenueChartWidget extends StatelessWidget {
  final List<ChartDataModel> list;
  final ChartDataKeyModel? data;

  RevenueChartWidget({
    required this.list,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: "Revenue",
      ),
      title: ChartTitle(text: 'Business sales data'),
      primaryXAxis: CategoryAxis(
        maximumLabels: 5,
        arrangeByIndex: true,
        autoScrollingDelta: 5,
      ),
      primaryYAxis: NumericAxis(
        minimum: (data?.minRevenue ?? 0).toDouble(),
        maximum: (data?.maxRevenue ?? 0).toDouble(),
        interval: 50,
        labelFormat: '{value} ₹',
      ),
      series: <CartesianSeries<ChartDataModel, String>>[
        ColumnSeries<ChartDataModel, String>(
          dataSource: list,
          xValueMapper: (ChartDataModel data, _) => (data.key ?? "").length < 3
              ? getMonthName(int.parse(data.key ?? "0"))
              : data.key ?? "",
          yValueMapper: (ChartDataModel data, _) => data.revenue,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
      ),
    );
  }
}
