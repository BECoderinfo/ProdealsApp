class NotificationListModel {
  String? sId;
  String? title;
  String? description;
  String? type;
  NotificationData? data;
  String? createdAt;
  String? updatedAt;
  int? iV;

  NotificationListModel(
      {this.sId,
      this.title,
      this.description,
      this.type,
      this.data,
      this.createdAt,
      this.updatedAt,
      this.iV});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    title = json['title'].toString();
    description = json['description'].toString();
    type = json['type'].toString();
    data = json['data'] != null
        ? new NotificationData.fromJson(json['data'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class NotificationData {
  String? offerName;
  String? offerId;

  NotificationData({this.offerName, this.offerId});

  NotificationData.fromJson(Map<String, dynamic> json) {
    offerName = json['offerName'].toString();
    offerId = json['offerId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerName'] = this.offerName;
    data['offerId'] = this.offerId;
    return data;
  }
}
