import 'package:pro_deals1/model_class/home_screen_model.dart';

class BusinessDetailModel {
  String? status;
  String? message;
  Business? business;

  BusinessDetailModel({this.status, this.message, this.business});

  BusinessDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class Business {
  MainImage? mainImage;
  MainImage? waterIdImage;
  MainImage? govermentIdImage;
  String? sId;
  UserId? userId;
  String? businessName;
  String? contactNumber;
  String? address;
  String? state;
  String? city;
  int? pincode;
  String? category;
  String? gstNumber;
  String? panNumber;
  ImageClass? proofImage;
  String? openTime;
  String? closeTime;
  dynamic offDays;
  dynamic areaSqures;
  String? description;
  List<MultipleImages>? menuImages;
  List<MultipleImages>? storeImages;
  int? iV;

  Business(
      {this.mainImage,
      this.waterIdImage,
      this.govermentIdImage,
      this.sId,
      this.userId,
      this.businessName,
      this.contactNumber,
      this.address,
      this.state,
      this.city,
      this.pincode,
      this.category,
      this.gstNumber,
      this.panNumber,
      this.proofImage,
      this.openTime,
      this.closeTime,
      this.offDays,
      this.areaSqures,
      this.description,
      this.menuImages,
      this.storeImages,
      this.iV});

  Business.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    waterIdImage = json['waterIdImage'] != null
        ? new MainImage.fromJson(json['waterIdImage'])
        : null;
    govermentIdImage = json['govermentIdImage'] != null
        ? new MainImage.fromJson(json['govermentIdImage'])
        : null;
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    businessName = json['businessName'];
    contactNumber = json['contactNumber'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    category = json['category'];
    gstNumber = json['gstNumber'];
    panNumber = json['panNumber'];
    proofImage = json['proofImage'] != null
        ? new ImageClass.fromJson(json['proofImage'])
        : null;
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    offDays = json['offDays'];
    areaSqures = json['areaSqures'];
    description = json['Description'];
    if (json['menuImages'] != null) {
      menuImages = <MultipleImages>[];
      json['menuImages'].forEach((v) {
        menuImages!.add(new MultipleImages.fromJson(v));
      });
    }
    if (json['storeImages'] != null) {
      storeImages = <MultipleImages>[];
      json['storeImages'].forEach((v) {
        storeImages!.add(new MultipleImages.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mainImage != null) {
      data['mainImage'] = this.mainImage!.toJson();
    }
    if (this.waterIdImage != null) {
      data['waterIdImage'] = this.waterIdImage!.toJson();
    }
    if (this.govermentIdImage != null) {
      data['govermentIdImage'] = this.govermentIdImage!.toJson();
    }
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['businessName'] = this.businessName;
    data['contactNumber'] = this.contactNumber;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['category'] = this.category;
    data['gstNumber'] = this.gstNumber;
    data['panNumber'] = this.panNumber;
    if (this.proofImage != null) {
      data['proofImage'] = this.proofImage!.toJson();
    }
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['offDays'] = this.offDays;
    data['areaSqures'] = this.areaSqures;
    data['Description'] = this.description;
    if (this.menuImages != null) {
      data['menuImages'] = this.menuImages!.map((v) => v.toJson()).toList();
    }
    if (this.storeImages != null) {
      data['storeImages'] = this.storeImages!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? status;
  bool? isBusiness;
  String? createdAt;
  String? updatedAt;
  int? iV;
  ImageClass? image;

  UserId(
      {this.sId,
      this.userName,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.status,
      this.isBusiness,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.image});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    isBusiness = json['isBusiness'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['address'] = this.address;
    data['status'] = this.status;
    data['isBusiness'] = this.isBusiness;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class OfferListModel {
  String? sId;
  String? businessId;
  String? offertype;
  String? productPrice;
  String? offerPrice;
  String? paymentAmount;
  String? validOn;
  String? description;
  List<String>? usedBy;
  String? expiryDate;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OfferListModel(
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

  OfferListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    businessId = json['businessId'].toString();
    offertype = json['offertype'].toString();
    productPrice = json['productPrice'].toString();
    offerPrice = json['offerPrice'].toString();
    paymentAmount = json['paymentAmount'].toString();
    validOn = json['validOn'].toString();
    description = json['description'].toString();
    usedBy = json['usedBy'].cast<String>();
    expiryDate = json['expiryDate'].toString();
    isActive = json['isActive'];
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
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

class CartListModel {
  Offer? offer;
  String? sId;

  CartListModel({this.offer, this.sId});

  CartListModel.fromJson(Map<String, dynamic> json) {
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Offer {
  String? sId;
  String? businessId;
  String? offertype;
  String? productPrice;
  String? offerPrice;
  String? paymentAmount;
  String? validOn;
  String? description;
  String? expiryDate;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Offer(
      {this.sId,
      this.businessId,
      this.offertype,
      this.productPrice,
      this.offerPrice,
      this.paymentAmount,
      this.validOn,
      this.description,
      this.expiryDate,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Offer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    businessId = json['businessId'].toString();
    offertype = json['offertype'].toString();
    productPrice = json['productPrice'].toString();
    offerPrice = json['offerPrice'].toString();
    paymentAmount = json['paymentAmount'].toString();
    validOn = json['validOn'].toString();
    description = json['description'].toString();
    expiryDate = json['expiryDate'].toString();
    isActive = json['isActive'];
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
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
    data['expiryDate'] = this.expiryDate;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
