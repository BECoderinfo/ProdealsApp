class PlansListModel {
  String? sId;
  String? planName;
  int? planPrice;
  int? planCount;
  String? planDuration;
  List<String>? planDescription;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PlansListModel(
      {this.sId,
      this.planName,
      this.planPrice,
      this.planCount,
      this.planDuration,
      this.planDescription,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PlansListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    planName = json['planName'].toString();
    planCount = json['planCount'];
    planPrice = json['planPrice'];
    planDuration = json['planDuration'].toString();
    planDescription = json['planDescription'].cast<String>();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['planName'] = this.planName;
    data['planCount'] = this.planCount;
    data['planPrice'] = this.planPrice;
    data['planDuration'] = this.planDuration;
    data['planDescription'] = this.planDescription;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
