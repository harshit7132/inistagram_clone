
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:inistagram_clone/second/models/messagemodel.dart';

class ChatService extends ChangeNotifier {
  final firebase = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  //Send Message
  Future<void> sendMessage(String receiverId, String message) async {
    //Get Current User Info
    final String currentUserId = firebase.currentUser!.uid;
    final String currentUserEmail = firebase.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //Create a New Message
    MessageModel newmessage = MessageModel(
        timestamp: timestamp,
        message: message,
        receiverId: receiverId,
        senderemail: currentUserEmail,
        senderId: currentUserId);

    //Construct ChatRoom with Unique Id
    List<String> id = [currentUserId, receiverId];
    id.sort(); //Sort The Ids (this ensures the chatroom id is always same for any pair of people's
    String chatroomId =
        id.join("_"); //Combine the Id into a single String to use a chat room
    await firestore
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("messages")
        .add(newmessage.toMap());
  }

  //Get The Messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    //Construct a ChatRoom
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatroomId = ids.join("_");
    return firestore
        .collection("chat_rooms")
        .doc(chatroomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
