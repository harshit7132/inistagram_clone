import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inistagram_clone/Custom_widgets/bubble_Styles.dart';
import 'package:inistagram_clone/second/services/chat/chat_service.dart';
import 'package:inistagram_clone/second/widgets/uihelper.dart';

class ChatPage extends StatefulWidget {
  final String receiveEmail;
  final String receiveruserId;
  const ChatPage(
      {super.key, required this.receiveEmail, required this.receiveruserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final firebase = FirebaseAuth.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiveruserId, messageController.text);
      //Clear The Text After Send Message
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiveEmail),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
                'https://is.zobj.net/image-server/v1/images?r=DBZ_detbClA07Z8Dbb5a5Dn-kprwa3QsD6L3yV647tKbM3FMKXwA_dk-FhrwHGnhyAU5iKZ2PLIEHPo010UFSGhilP10BKL5p2StZr3UJ5sybIENj5rcPmIn3ish9xxmbMKZ7NDwSfK0wQkgxbJ4vo1vtU3Rz14ac4HSAuXYnbEApbPaaVcjz-ZuDoRtYPd0ZH6NcJNVPq37vyin3hpPEfh22hdEx4AMa9oFaA',
                fit: BoxFit.cover),
          ),
          Column(
            children: [
              Expanded(child: _buildMessageList()),
              //User Input
              _buildMessageInput()
            ],
          ),
        ],
      ),
    );
  }

  //Build Message List
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiveruserId, firebase.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child:
                  Text("Oops an Error Occured ${snapshot.hasError.toString()}"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading..."),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  //Build Message Item
  Widget _buildMessageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    //Align the messages to right side
    var alignment = (data["senderId"] == firebase.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data["senderId"] == firebase.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          data["senderId"] == firebase.currentUser!.uid
              ? GestureDetector(
                  onDoubleTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('You want to delete?'),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        //delete logic
                                      },
                                      child: Text('yes')),
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('No')),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: Bubble(
                      style: bubble_Styles.styleMe,
                      child: Text("${data["message"]}")),
                )
              : Bubble(
                  style: bubble_Styles.styleSomebody,
                  child: Text("${data["message"]}"),
                )
        ],
      ),
    );
  }

  //Build Message Input
  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
            child: UiHelper.CustomTextField(
                messageController, "Send Message...", false)),
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              size: 40,
            ))
      ],
    );
  }
}
