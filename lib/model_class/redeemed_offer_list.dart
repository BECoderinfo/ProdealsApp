import 'package:pro_deals1/model_class/home_screen_model.dart';

class RedeemedOfferListModel {
  String? description;
  String? averageRating;
  ROfferBusinessData? business;

  RedeemedOfferListModel({this.description, this.averageRating, this.business});

  RedeemedOfferListModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    averageRating = (json['averageRating'] ?? "").toString();
    business = json['business'] != null
        ? new ROfferBusinessData.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['averageRating'] = this.averageRating;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class ROfferBusinessData {
  MainImage? mainImage;
  String? sId;
  String? businessName;
  String? address;
  String? state;
  String? city;
  int? pincode;

  ROfferBusinessData(
      {this.mainImage,
      this.sId,
      this.businessName,
      this.address,
      this.state,
      this.city,
      this.pincode});

  ROfferBusinessData.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    sId = json['_id'];
    businessName = json['businessName'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainImage != null) {
      data['mainImage'] = this.mainImage!.toJson();
    }
    data['_id'] = this.sId;
    data['businessName'] = this.businessName;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}
