import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserData{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userUid;

  setUserData(UserModel usermodel) async{
    await firestore.collection('users').doc(auth.currentUser!.uid).set(usermodel.toJson());



  }

}