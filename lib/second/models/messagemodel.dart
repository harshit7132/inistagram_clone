import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String senderemail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  MessageModel(
      {required this.timestamp,
      required this.message,
      required this.receiverId,
      required this.senderemail,
      required this.senderId});

  Map<String,dynamic>toMap(){
    return {
      "senderId":senderId,
      "senderemail":senderemail,
      "receiverId":receiverId,
      "message":message,
      "timestamp":timestamp
    };
  }
}
