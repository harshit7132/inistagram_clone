// import 'package:cloud_firestore_platform_interface/src/timestamp.dart';

// class MessageModel {
//   String? messageid;
//   String? sender;
//   String? text;
//   bool? seen;
//   DateTime? createdon;

//   MessageModel(
//       {this.messageid, this.sender, this.text, this.seen, this.createdon, required Timestamp timestamp, required String message, required String receiverId, required String senderemail, required String senderId});

//   MessageModel.fromMap(Map<String, dynamic> map) {
//     messageid = map["messageid"];
//     sender = map["sender"];
//     text = map["text"];
//     seen = map["seen"];
//     createdon = map["createdon"].toDate();
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       "messageid": messageid,
//       "sender": sender,
//       "text": text,
//       "seen": seen,
//       "createdon": createdon
//     };
//   }
// }
