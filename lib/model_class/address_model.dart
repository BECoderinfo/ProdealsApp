class AddressModel {
  String? sId;
  String? userId;
  String? userName;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AddressModel(
      {this.sId,
      this.userId,
      this.userName,
      this.phone,
      this.email,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AddressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    userId = json['userId'].toString();
    userName = json['userName'].toString();
    phone = json['phone'].toString();
    email = json['email'].toString();
    address = json['address'].toString();
    city = json['city'].toString();
    state = json['state'].toString();
    pincode = json['pincode'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
