import 'package:pro_deals1/model_class/home_screen_model.dart';

class OrderListModel {
  String? sId;
  BusinessId? businessId;
  String? status;
  String? orderStatus;
  OrderUserData? userId;
  List<OrderOfferData>? offerId;
  List<int>? quantity;
  String? offerprice;
  String? promocode;
  String? discount;
  String? totalPrice;
  String? totalsave;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OrderListModel(
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

  OrderListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessId = json['businessId'] != null
        ? new BusinessId.fromJson(json['businessId'])
        : null;
    status = json['status'];
    orderStatus = json['orderStatus'];
    userId = json['userId'] != null
        ? new OrderUserData.fromJson(json['userId'])
        : null;
    if (json['offerId'] != null) {
      offerId = <OrderOfferData>[];
      json['offerId'].forEach((v) {
        offerId!.add(new OrderOfferData.fromJson(v));
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

class BusinessId {
  String? sId;
  String? businessName;
  String? contactNumber;
  String? address;
  String? state;
  String? city;
  String? pincode;
  MainImage? mainImage;

  BusinessId(
      {this.sId,
      this.mainImage,
      this.businessName,
      this.contactNumber,
      this.address,
      this.state,
      this.city,
      this.pincode});

  BusinessId.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    sId = json['_id'].toString();
    businessName = json['businessName'].toString();
    contactNumber = json['contactNumber'].toString();
    address = json['address'].toString();
    state = json['state'].toString();
    city = json['city'].toString();
    pincode = json['pincode'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['businessName'] = this.businessName;
    if (this.mainImage != null) {
      data['mainImage'] = this.mainImage!.toJson();
    }
    data['contactNumber'] = this.contactNumber;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class OrderUserData {
  String? sId;
  String? userName;
  String? email;
  String? phone;
  ImageClass? image;

  OrderUserData({this.sId, this.userName, this.email, this.phone, this.image});

  OrderUserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    userName = json['userName'].toString();
    email = json['email'].toString();
    phone = json['phone'].toString();
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class OrderOfferData {
  String? sId;
  String? businessId;
  String? offertype;
  int? productPrice;
  int? offerPrice;
  int? paymentAmount;
  String? validOn;
  String? description;
  List<String>? usedBy;
  String? expiryDate;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OrderOfferData(
      {this.sId,
      this.businessId,
      this.offertype,
      this.productPrice,
      this.offerPrice,
      this.paymentAmount,
      this.validOn,
      this.description,
      this.usedBy,
      this.expiryDate,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  OrderOfferData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessId = json['businessId'];
    offertype = json['offertype'];
    productPrice = json['productPrice'];
    offerPrice = json['offerPrice'];
    paymentAmount = json['paymentAmount'];
    validOn = json['validOn'];
    description = json['description'];
    usedBy = json['usedBy'].cast<String>();
    expiryDate = json['expiryDate'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['businessId'] = this.businessId;
    data['offertype'] = this.offertype;
    data['productPrice'] = this.productPrice;
    data['offerPrice'] = this.offerPrice;
    data['paymentAmount'] = this.paymentAmount;
    data['validOn'] = this.validOn;
    data['description'] = this.description;
    data['usedBy'] = this.usedBy;
    data['expiryDate'] = this.expiryDate;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
