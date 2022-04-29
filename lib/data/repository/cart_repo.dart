
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/api/cart_api.dart';
import 'package:fitandfresh/data/models/cart.dart';

class CartRepo {

  CartRepo();

  getAllCartItems() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var userId = auth.currentUser!.uid;
    return firestore.collection('Cart')
        .doc(userId)
        .collection('items')
        .snapshots().map((event) {
      final List<CartModel>cartmodel = [];

      for (var element in event.docs) {
        CartModel cart = CartModel.fromJson(element.data());
        cart.id = element.id;
        cartmodel.add(cart);
      }
      return cartmodel;
    });
  }

}