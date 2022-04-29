
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/data/models/favModel.dart';

class FavApi{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  addToFav(FavModel favModel)async{
    var  userId=  auth.currentUser!.uid;

  // var favId=    firestore.collection('Users').doc(userId).collection('Favourites').doc().id;
    //favModel.orderModel!.isFavourite=true;
    await firestore.collection('users').doc(userId).collection('Favourites').doc() .set(favModel.toJson());

  }



    }