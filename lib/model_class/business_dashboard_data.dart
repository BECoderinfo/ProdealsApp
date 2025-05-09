class BusinessDashboardData {
  String? totalEarning;
  String? totalOrders;
  String? reedemedPromocode;
  String? activeOffers;

  BusinessDashboardData({
    this.totalEarning,
    this.totalOrders,
    this.reedemedPromocode,
    this.activeOffers,
  });

  BusinessDashboardData.fromJson(Map<String, dynamic> json) {
    totalEarning = (json['totalEarning'] ?? "0").toString();
    totalOrders = (json['totalOrders'] ?? "0").toString();
    reedemedPromocode = (json['offerData'] ?? "0").toString();
    activeOffers = (json['activeOffers'] ?? "0").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalEarning'] = this.totalEarning;
    data['totalOrders'] = this.totalOrders;
    data['offerData'] = this.reedemedPromocode;
    data['activeOffers'] = this.activeOffers;
    return data;
  }
}
