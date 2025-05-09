class ChartDataModel {
  String? key;
  dynamic orders;
  dynamic revenue;

  ChartDataModel({this.key, this.orders, this.revenue});

  ChartDataModel.yearModelClass(Map<String, dynamic> json) {
    key = json['year'].toString();
    orders = json['Orders'];
    revenue = json['revenue'];
  }

  ChartDataModel.monthModelClass(Map<String, dynamic> json) {
    key = json['month'].toString();
    orders = json['Orders'];
    revenue = json['revenue'];
  }

  ChartDataModel.dayModelClass(Map<String, dynamic> json) {
    key = json['day'].toString();
    orders = json['Orders'];
    revenue = json['revenue'];
  }
}

class ChartDataKeyModel {
  int? minOrder;
  int? maxOrder;
  String? totalOrder;
  int? minRevenue;
  int? maxRevenue;
  String? totalRevenue;

  ChartDataKeyModel({
    required this.minOrder,
    required this.maxOrder,
    required this.totalOrder,
    required this.minRevenue,
    required this.maxRevenue,
    required this.totalRevenue,
  });
}
