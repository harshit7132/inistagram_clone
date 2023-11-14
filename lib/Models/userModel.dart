class UserModel {
  String? id;
  String? username;
  String? email;
  String? password;
  String? mobile;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.mobile,
  });

  UserModel.fromMap(Map<String, dynamic> map, _) {
    id = map["Id"];
    username = map["UserName"];
    email = map["E-mail"];
    password = map["PassWord"];
    mobile = map["MobileNumber"];
  }

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "UserName": username,
      "E-mail": email,
      "PassWord": password,
      "MobileNumber": mobile,
    };
  }
}
