class UserModel {
  String? id;
  String? fullName;
  String? username;
  String? dob;
  String? email;
  String? password;
  String? mobile;

  UserModel({
    this.id,
    this.fullName,
    this.username,
    this.dob,
    this.email,
    this.password,
    this.mobile,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map["Id"];
    fullName = map["fullName"];
    dob = map["dob"];
    username = map["UserName"];
    email = map["E-mail"];
    password = map["PassWord"];
    mobile = map["MobileNumber"];
  }

  Map<String, dynamic> toMap() {
    return {
      "Id": id,
      "fullName": fullName,
      "dob": dob,
      "UserName": username,
      "E-mail": email,
      "PassWord": password,
      "MobileNumber": mobile,
    };
  }
}
//
// class UserModel {
//   String? uid;
//   String? fullname;
//   String? email;
//   String? profilepic;
//
//   UserModel({this.uid, this.fullname, this.email, this.profilepic});
//
//   UserModel.fromMap(Map<String, dynamic> map) {
//     uid = map["uid"];
//     fullname = map["fullname"];
//     email = map["email"];
//     profilepic = map["profilepic"];
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       "uid": uid,
//       "fullname": fullname,
//       "email": email,
//       "profilepic": profilepic,
//     };
//   }
// }
