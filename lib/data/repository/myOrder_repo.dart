
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/api/cart_api.dart';
import 'package:fitandfresh/data/models/cart.dart';

class MyOrderRepo{
  List<CartModel>myorderList=[];

  MyOrderRepo(this.myorderList);

  getAllOrderItems(){
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var  userId=  auth.currentUser!.uid;
    return   firestore.collection('Orders')
        .doc(userId)
        .collection('items')
        .get()
//      CartApi cartApi=CartApi();
//      cartApi.getCart();

        .then((value){
      value.docs.forEach((element){
        CartModel cart=CartModel.fromJson(element.data());
        cart.id=element.id;
        myorderList.add(cart);

      });
      return myorderList;

    });
  }



}