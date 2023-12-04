
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inistagram_clone/second/services/auth/authservice.dart';
import 'package:inistagram_clone/second/widgets/uihelper.dart';
import 'package:provider/provider.dart';

import 'chatpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firebaseauth=FirebaseAuth.instance;
  void logout()async{
    final auth=Provider.of<AuthService>(context,listen: false);
    try{
      auth.logOut();
    }
    catch(ex){
      return UiHelper.CustomSnackbar(ex.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
        actions: [
          TextButton(onPressed: (){
            logout();
          }, child: Icon(Icons.logout,color: Colors.white,))
        ],
      ),
      body: buildUsersList(),
    );
  }

  Widget buildUsersList(){
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("Users").snapshots(), builder: (context,snapshot){
      if(snapshot.hasError){
        return Center(child: Text("Oops an Error Occured!!"),);
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      return ListView(
        children: snapshot.data!.docs.map<Widget>((doc) => buildUserItem(doc)).toList(),
      );
    });
  }

  Widget buildUserItem(DocumentSnapshot documentSnapshot){
    Map<String,dynamic>data=documentSnapshot.data()! as Map<String,dynamic>;

    if(firebaseauth.currentUser!.email!=data["Email"]){
      return ListTile(
        title: Text("${data["Email"]}"),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatPage(receiveEmail: data["Email"],receiveruserId: data["Uid"],)));
        },
      );
    }
    else{
      return Container();
    }
  }
}
