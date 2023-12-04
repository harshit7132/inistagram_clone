import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:inistagram_clone/second/widgets/uihelper.dart';

class AuthService extends ChangeNotifier{
  final firebaseauth=FirebaseAuth.instance;
  final firestore=FirebaseFirestore.instance;
  Future<UserCredential>login(String email,String password,BuildContext context)async{
    if(email=="" && password==""){
      return UiHelper.CustomSnackbar("Enter Required Fields", context);
    }
    else{
      try{
        UserCredential userCredential=await firebaseauth.signInWithEmailAndPassword(email: email, password: password);
        firestore.collection("Users").doc(userCredential.user!.uid).set({
          "Uid":userCredential.user!.uid,
          "Email":email,
        },SetOptions(merge: true));
        return userCredential;
      }
      on FirebaseAuthException catch(ex){
        throw Exception(ex.code.toString());
      }

    }
  }


  Future<UserCredential>signUp(String email,String password,String confirmpassword,BuildContext context)async{
   if(email=="" && password=="" && confirmpassword==""){
     return UiHelper.CustomSnackbar("Enter Required Fields", context);
   }
   else{
     try{
       UserCredential userCredential=await firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
       firestore.collection("Users").doc(userCredential.user!.uid).set({
         "Uid":userCredential.user!.uid,
         "Email":email,
       });
       return userCredential;
     }
     on FirebaseAuthException catch(ex){
       throw Exception(ex.code.toString());
     }
   }
  }

  Future<void>logOut()async{
    return await firebaseauth.signOut();
  }
}