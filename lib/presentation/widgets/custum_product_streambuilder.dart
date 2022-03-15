import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfresh/data/api/product_api.dart';
import 'package:fitandfresh/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/order.dart';
    class CustomStreamBuilder extends StatelessWidget {
      OrderModel orderModel=OrderModel();
      ProductApi productApi=ProductApi();

      Widget widget;
      List orderList;

      CustomStreamBuilder({required this.widget,required this.orderList});

      @override
      Widget build(BuildContext context) {
        return StreamBuilder<QuerySnapshot>(
            stream: productApi.getProducts(),
            builder: (context,snapshot){
                if (snapshot.hasData) {
                print(snapshot);
                print(snapshot.data);
                print(snapshot.data!.size);
                print(snapshot.data!.docs);
                orderList.clear();

                for (var doc in snapshot.data!.docs) {
                  orderList.add(
                    // orderModel.fromJson(doc)
                      OrderModel(img:doc.get('productImage'),
                          itemName: doc.get('productName'),
                          itemPrice: doc.get('productPrice'),
                          protein: doc.get('productProtein'),
                          fat: doc.get('productFats'),
                          calory: doc.get('productCalory'),
                          carb: doc.get('productCarb'),
                          desc: doc.get('productDesc')
                      )

                  );
                  print(doc.get('productCalory'));
                  print(doc.get('productCalory'));
                  print(doc.get('productCalory'));
                  print(doc.get('productCalory'));



                }
                return widget;

              }else{
                return Container(color: Colors.red,);

              }


            }
        );
      }
    }
