import 'package:pro_deals1/model_class/home_screen_model.dart';

class UserOrderHistoryListModel {
  String? sId;
  UserBusinessData? businessId;
  String? status;
  String? orderStatus;
  UserData? userId;
  List<UserOfferId>? offerId;
  List<int>? quantity;
  String? offerprice;
  String? promocode;
  String? discount;
  String? totalPrice;
  String? totalsave;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserOrderHistoryListModel(
      {this.sId,
      this.businessId,
      this.status,
      this.orderStatus,
      this.userId,
      this.offerId,
      this.quantity,
      this.offerprice,
      this.promocode,
      this.discount,
      this.totalPrice,
      this.totalsave,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserOrderHistoryListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessId = json['businessId'] != null
        ? new UserBusinessData.fromJson(json['businessId'])
        : null;
    status = json['status'];
    orderStatus = json['orderStatus'];
    userId =
        json['userId'] != null ? new UserData.fromJson(json['userId']) : null;
    if (json['offerId'] != null) {
      offerId = <UserOfferId>[];
      json['offerId'].forEach((v) {
        offerId!.add(new UserOfferId.fromJson(v));
      });
    }
    quantity = json['quantity'].cast<int>();
    offerprice = json['offerprice'].toString();
    promocode = json['promocode'];
    discount = json['discount'].toString();
    totalPrice = json['totalPrice'].toString();
    totalsave = json['totalsave'].toString();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.businessId != null) {
      data['businessId'] = this.businessId!.toJson();
    }
    data['status'] = this.status;
    data['orderStatus'] = this.orderStatus;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.offerId != null) {
      data['offerId'] = this.offerId!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['offerprice'] = this.offerprice;
    data['promocode'] = this.promocode;
    data['discount'] = this.discount;
    data['totalPrice'] = this.totalPrice;
    data['totalsave'] = this.totalsave;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class UserBusinessData {
  MainImage? mainImage;
  String? sId;
  String? businessName;
  String? contactNumber;
  String? address;
  String? state;
  String? city;
  String? pincode;

  UserBusinessData(
      {this.mainImage,
      this.sId,
      this.businessName,
      this.contactNumber,
      this.address,
      this.state,
      this.city,
      this.pincode});

  UserBusinessData.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    sId = json['_id'];
    businessName = json['businessName'];
    contactNumber = json['contactNumber'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainImage != null) {
      data['mainImage'] = this.mainImage!.toJson();
    }
    data['_id'] = this.sId;
    data['businessName'] = this.businessName;
    data['contactNumber'] = this.contactNumber;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class UserData {
  String? sId;
  String? userName;
  ImageClass? image;

  UserData({this.sId, this.userName, this.image});

  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class UserOfferId {
  String? sId;
  String? description;

  UserOfferId({
    this.sId,
    this.description,
  });

  UserOfferId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    return data;
  }
}
