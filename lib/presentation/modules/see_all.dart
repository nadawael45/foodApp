import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitandfresh/data/api/product_api.dart';
import 'package:fitandfresh/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/order.dart';
import 'orderScreen.dart';

class SeeAll extends StatelessWidget {
  OrderModel orderModel=OrderModel();
  List<OrderModel> orderList = [];

  ProductApi productApi=ProductApi();
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
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) =>CustomCard(
                  function: (){
                    Navigator.push(context, MaterialPageRoute
                      (builder: (_)=>OrderScreen(orderList[index])));
                  },
                  itemName: orderList[index].itemName,
                  itemPrice: orderList[index].itemPrice,
                  img: orderList[index].img,

                ),


              );

            }else{
              return Container(color: Colors.red,);

            }


        }
    );
  }
}
