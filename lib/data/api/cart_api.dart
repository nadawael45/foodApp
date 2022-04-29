import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/data/models/product.dart';

class CartApi{
 // CartModel orderModel=CartModel();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

   String? cartId;

//  getCart(){
//
//    var  userId=  auth.currentUser!.uid;
//    return   firestore.collection('Cart')
//        .doc(userId)
//        .collection('items')
//        .get();
//  }

  addToCart(CartModel cartModel)async{
    var  userId=  auth.currentUser!.uid;

    await  firestore.collection('Cart').doc(userId).set(
        {
          'Total':cartModel.total,

        }
    );
     cartId=   firestore.collection('Cart').doc(userId).collection('items').doc().id;
    await firestore.collection('Cart').doc(userId).collection('items').doc(cartId)
        .set(cartModel.toJson(cartId),
//      'ItemName':cartModel.orderName,
//      'Quantity':cartModel.quantity,
//      'Price':cartModel.price,
//      'ItemImage':cartModel.img,

    );
  }


  removeFromCart(itemIndex){
    var  userId=  auth.currentUser!.uid;
    return   firestore.collection('Cart')
        .doc(userId)
        .collection('items')
        .doc(itemIndex.id)
        .delete();

  }

}