class CityListModel {
  String? sId;
  String? cityname;
  int? iV;

  CityListModel({this.sId, this.cityname, this.iV});

  CityListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityname = json['Cityname'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Cityname'] = this.cityname;
    data['__v'] = this.iV;
    return data;
  }
}

class BusinessListModel {
  MainImage? mainImage;
  String? sId;
  String? businessName;
  String? address;
  String? state;
  String? city;
  String? pincode;
  String? category;
  String? averageRating;

  BusinessListModel({
    this.mainImage,
    this.sId,
    this.businessName,
    this.address,
    this.state,
    this.city,
    this.pincode,
    this.category,
    this.averageRating,
  });

  BusinessListModel.fromJson(Map<String, dynamic> json) {
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    sId = json['_id'];
    businessName = json['businessName'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    pincode = (json['pincode'] ?? "").toString();
    category = json['category'];
    averageRating = (json['averageRating'] ?? 0).toString();
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
    data['category'] = this.category;
    data['averageRating'] = this.averageRating;
    return data;
  }
}

class MainImage {
  ImageClass? data;
  String? contentType;

  MainImage({this.data, this.contentType});

  MainImage.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ImageClass.fromJson(json['data']) : null;
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['contentType'] = this.contentType;
    return data;
  }
}

class MultipleImages {
  ImageClass? data;
  String? contentType;
  String? sId;

  MultipleImages({this.data, this.contentType, this.sId});

  MultipleImages.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new ImageClass.fromJson(json['data']) : null;
    contentType = json['contentType'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['contentType'] = this.contentType;
    data['_id'] = this.sId;
    return data;
  }
}

class BannerListModel {
  String? sId;
  OfferId? offerId;
  ImageClass? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? type;

  BannerListModel(
      {this.sId,
      this.offerId,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.type});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    offerId =
        json['offerId'] != null ? new OfferId.fromJson(json['offerId']) : null;
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.offerId != null) {
      data['offerId'] = this.offerId!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['type'] = this.type;
    return data;
  }
}

class OfferId {
  String? sId;
  String? businessId;
  String? offertype;
  int? productPrice;
  int? offerPrice;
  int? paymentAmount;
  String? validOn;
  String? description;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OfferId(
      {this.sId,
      this.businessId,
      this.offertype,
      this.productPrice,
      this.offerPrice,
      this.paymentAmount,
      this.validOn,
      this.description,
      this.expiryDate,
      this.createdAt,
      this.updatedAt,
      this.iV});

  OfferId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    businessId = json['businessId'];
    offertype = json['offertype'];
    productPrice = json['productPrice'];
    offerPrice = json['offerPrice'];
    paymentAmount = json['paymentAmount'];
    validOn = json['validOn'];
    description = json['description'];

    expiryDate = json['expiryDate'];
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
    data['expiryDate'] = this.expiryDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CategoryListModel {
  String? sId;
  String? category;
  ImageClass? icon;
  ImageClass? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryListModel(
      {this.sId,
      this.category,
      this.icon,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    icon = json['icon'] != null ? new ImageClass.fromJson(json['icon']) : null;
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category'] = this.category;
    if (this.icon != null) {
      data['icon'] = this.icon!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FoodTypeListModel {
  String? sId;
  String? foodType;
  ImageClass? image;
  String? city;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FoodTypeListModel(
      {this.sId,
      this.foodType,
      this.image,
      this.city,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FoodTypeListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    foodType = json['foodType'];
    image =
        json['image'] != null ? new ImageClass.fromJson(json['image']) : null;
    city = json['city'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['foodType'] = this.foodType;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['city'] = this.city;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ImageClass {
  String? type;
  List<int>? data;

  ImageClass({this.type, this.data});

  ImageClass.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}
