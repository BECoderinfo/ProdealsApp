class UserLoginData {
  String? status;
  String? message;
  LoginData? data;

  UserLoginData({this.status, this.message, this.data});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  String? sId;
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? status;
  bool? isBusiness;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LoginData(
      {this.sId,
      this.userName,
      this.email,
      this.phone,
      this.password,
      this.status,
      this.isBusiness,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LoginData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'].toString();
    userName = json['userName'].toString();
    email = json['email'].toString();
    phone = (json['phone'] ?? "").toString();
    password = json['password'].toString();
    status = json['status'].toString();
    isBusiness = json['isBusiness'];
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['status'] = this.status;
    data['isBusiness'] = this.isBusiness;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
