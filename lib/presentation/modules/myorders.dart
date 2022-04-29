import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_states.dart';
import 'package:fitandfresh/presentation/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/cart/cart_cubit.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';

class MyOrders extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {



   return
       CustomScaffold(
        boolAppBar:true ,
        text: 'My Orders'.tr(),prefixIcon: Icons.arrow_back,
        prefixFunction: ()=>Navigator.of(context).pushNamedAndRemoveUntil(homepath,(context)=>false),
        body:BlocBuilder<CartCubit,CartStates>(
          builder: (BuildContext context, state) {
            print('nnnnnnnnnnnn');
            print(CartCubit.get(context).myOrderCubit.length);
            if(state is RemoveCartAddOrder){
              CartCubit.get(context).myOrderCubit.clear();

              CartCubit.get(context).getMyOrders();
              print('nnnnnnnnnnnn');
              print(CartCubit.get(context).myOrderCubit.length);
            }
            return   ListView.builder(

                itemCount: CartCubit.get(context).myOrderCubit.length,
                itemBuilder: (context,index){
                  var date =CartCubit.get(context).myOrderCubit[index].productId;
                  return CustomOrder(
                    img:CartCubit.get(context).myOrderCubit[index].img ,
                    itemName:CartCubit.get(context).myOrderCubit[index].orderName ,
                    date:'',
                   // DateTime.parse(date.toDate().toString());,
                  );
                });

          },

        ),

         scaffKey: scaffKey,



    );
  }
}
