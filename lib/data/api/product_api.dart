import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/order.dart';

class ProductApi{
  OrderModel orderModel=OrderModel();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
 getProducts(){
   var snapshot= firestore.collection('products').snapshots();
//       .listen((event) {event.docs.forEach((element) {orderModel.fromJson(element); }); });
   return snapshot;
 }
 getNewProducts(){

 }
}