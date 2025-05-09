class UserRegisterData {
  String? status;
  String? message;
  User? user;
  String? otp;

  UserRegisterData({this.status, this.message, this.user, this.otp});

  UserRegisterData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['otp'] = this.otp;
    return data;
  }
}

class User {
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? status;
  bool? isBusiness;
  String? otp;
  String? otpExpires;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.userName,
      this.email,
      this.phone,
      this.password,
      this.status,
      this.isBusiness,
      this.otp,
      this.otpExpires,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'].toString();
    email = json['email'].toString();
    phone = json['phone'].toString();
    password = json['password'].toString();
    status = json['status'].toString();
    isBusiness = json['isBusiness'];
    otp = json['otp'].toString();
    otpExpires = json['otpExpires'].toString();
    sId = json['_id'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['status'] = this.status;
    data['isBusiness'] = this.isBusiness;
    data['otp'] = this.otp;
    data['otpExpires'] = this.otpExpires;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
