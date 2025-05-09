class PromocodeListModel {
  String? sId;
  String? promocode;
  List<String>? usedBy;
  String? neededAmount;
  String? discountType;
  String? discount;
  String? description;
  String? expiryDate;
  int? iV;

  PromocodeListModel(
      {this.sId,
      this.promocode,
      this.usedBy,
      this.neededAmount,
      this.discountType,
      this.discount,
      this.description,
      this.expiryDate,
      this.iV});

  PromocodeListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    promocode = json['promocode'].toString();
    usedBy = json['usedBy'].cast<String>();
    neededAmount = json['neededAmount'].toString();
    discountType = json['discountType'].toString();
    discount = json['discount'].toString();
    description = json['description'].toString();
    expiryDate = json['expiryDate'].toString();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['promocode'] = this.promocode;
    data['usedBy'] = this.usedBy;
    data['neededAmount'] = this.neededAmount;
    data['discountType'] = this.discountType;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['expiryDate'] = this.expiryDate;
    data['__v'] = this.iV;
    return data;
  }
}
