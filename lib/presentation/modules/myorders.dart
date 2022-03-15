import 'package:fitandfresh/data/models/order.dart';
import 'package:fitandfresh/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/myorders_model.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
class MyOrders extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return
       CustomScaffold(
        boolAppBar:true ,
        text: 'My Orders',prefixIcon: Icons.arrow_back,
        prefixFunction: ()=>Navigator.of(context).pushNamed(homepath),
        body:ListView.builder(

          itemCount: myOrderList.length,
            itemBuilder: (context,index){
          return CustomOrder(
            img:myOrderList[index].img ,
            itemName:myOrderList[index].itemName ,
            date: myOrderList[index].date,
          );
        }),

    );
  }
}
