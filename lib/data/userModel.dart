class UserModel {
  int? status;
  String? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? phoneNumber;
  String? address;
  String? photo;
  String? token;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.status,
      this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.phoneNumber,
      this.address,
      this.photo,
      this.token,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    photo = json['photo'];
    token = json['token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['photo'] = photo;
    data['token'] = token;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
