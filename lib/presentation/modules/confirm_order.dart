import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/data/models/product.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_cubit.dart';
import 'package:fitandfresh/presentation/widgets/address_info.dart';
import 'package:fitandfresh/presentation/widgets/custom_scaffold.dart';
import 'package:fitandfresh/shared/app_routes.dart';
import 'package:fitandfresh/shared/constants/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/cart/cart_states.dart';
import 'package:easy_localization/easy_localization.dart';

class ConfermOrder extends StatelessWidget {
 var total;

 ConfermOrder(this.total);
 List<CartModel>cartlist=[];

 GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  TextEditingController? controllerPhone=TextEditingController() ;
  TextEditingController? controllerLocation =TextEditingController() ;
  TextEditingController? controllerStreet =TextEditingController();
  TextEditingController? controllerMark =TextEditingController();
  TextEditingController? controllerName =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        boolAppBar: true,
          text: 'Address Details'.tr(),
          prefixIcon: Icons.arrow_back,
          prefixFunction: () {
            Navigator.of(context).pop();
          },


        body:


        BlocConsumer<CartCubit,CartStates>(
          listener: (BuildContext context, state) {
            if(state is RemoveCartAddOrder ){
                 Navigator.pushNamedAndRemoveUntil(context, myOrder,(context)=>false);

            }

          },
          builder: (BuildContext context, Object? state) {
            if(state is GetCartSuccess){
              cartlist=state.cartList;
            }
            return    AddressInfo(
            txtBtn: 'Confirm Order'.tr(),
            function: (){
             // CartCubit.get(context).getCartItems();
            CartCubit.get(context).removeCartAndCreateOrder(
            total: total,
            name: controllerName!.text,
            phone: controllerPhone!.text,
            street: controllerStreet!.text,
            location: controllerLocation!.text,
            comment: controllerMark!.text,
              cartCubit: cartlist,


            );},
            controllerLocation: controllerLocation,
            controllerMark: controllerMark,
            controllerPhone: controllerPhone,
            controllerName: controllerName,
            controllerStreet: controllerStreet,

            );

          },
        ), scaffKey: scaffoldKey,
      ),
    );
  }
}
