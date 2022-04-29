import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/product.dart';

class ProductApi{

   ProductApi();





   Stream<List<OrderModel>> getProducts(){

     final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final FirebaseAuth auth = FirebaseAuth.instance;
   return firestore.collection('products').snapshots().map((event)  {
     final List <OrderModel> productList=[];

     for(var element in  event.docs){
       OrderModel  orderModel=OrderModel.fromJson(element.data());
       orderModel.id=element.id;
       print('iddddddddddddddddddd');
       print(element.id);
       print(orderModel.id);
   productList.add(orderModel.copyWith(id: element.id));
       // productList.add(orderModel.copyWith(id: orderModel.id));




     }
         return productList;

     });

 }





}