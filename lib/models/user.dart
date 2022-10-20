class User {
  late int id;
  late String name;
  String? email;
  late String mobile;
  late String gender;
  late bool active;
  late bool verified;
  late String cityId;
  late String token;
  late String tokenType;
  late String refreshToken;
  late String password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    active = json['active'];
    verified = json['verified'];
    cityId = json['city_id'];
    token = json['token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
  }
}



// class Store {
//   int id;
//   String name;
//   String storeName;
//   String email;
//   Null emailVerifiedAt;
//   String mobile;
//   String storeUuid;
//   String cityId;
//   Null verificationCode;
//   String active;
//   String verified;
//   Null firebaseKey;
//   Null image;
//   String address;
//   Null facebook;
//   Null instagram;
//   String createdAt;
//   String updatedAt;

//   Store(
//       {this.id,
//       this.name,
//       this.storeName,
//       this.email,
//       this.emailVerifiedAt,
//       this.mobile,
//       this.storeUuid,
//       this.cityId,
//       this.verificationCode,
//       this.active,
//       this.verified,
//       this.firebaseKey,
//       this.image,
//       this.address,
//       this.facebook,
//       this.instagram,
//       this.createdAt,
//       this.updatedAt});

//   Store.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     storeName = json['store_name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     mobile = json['mobile'];
//     storeUuid = json['store_uuid'];
//     cityId = json['city_id'];
//     verificationCode = json['verification_code'];
//     active = json['active'];
//     verified = json['verified'];
//     firebaseKey = json['firebase_key'];
//     image = json['image'];
//     address = json['address'];
//     facebook = json['facebook'];
//     instagram = json['instagram'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['store_name'] = this.storeName;
//     data['email'] = this.email;
//     data['email_verified_at'] = this.emailVerifiedAt;
//     data['mobile'] = this.mobile;
//     data['store_uuid'] = this.storeUuid;
//     data['city_id'] = this.cityId;
//     data['verification_code'] = this.verificationCode;
//     data['active'] = this.active;
//     data['verified'] = this.verified;
//     data['firebase_key'] = this.firebaseKey;
//     data['image'] = this.image;
//     data['address'] = this.address;
//     data['facebook'] = this.facebook;
//     data['instagram'] = this.instagram;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
