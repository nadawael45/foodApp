import 'package:easy_localization/easy_localization.dart';
import 'package:fitandfresh/data/api/cart_api.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_states.dart';
import 'package:fitandfresh/domain/cubit/quantity/quantity_cubit.dart';
import 'package:fitandfresh/domain/cubit/quantity/quantity_states.dart';
import 'package:fitandfresh/presentation/widgets/custom_list_tile.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/cart.dart';
import '../../domain/cubit/cart/cart_cubit.dart';
import '../../domain/cubit/location/location_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/screens.dart';
import '../dialoges/toast.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/item_order.dart';
import 'confirm_order.dart';



class Cart extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
CartModel cartmodel=CartModel();
List<CartModel> cartList=[];
 CartApi cartApi=CartApi();
 int quantity = 1;
 String? id;
  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      scaffKey: scaffoldKey,
      boolAppBar: true,
        text: 'Order Details'.tr(),prefixIcon: Icons.arrow_back,suffixIcon: Icons.help,
        prefixFunction: (){
          Navigator.of(context).popAndPushNamed(homepath);
        },



      body: SingleChildScrollView(
          child: BlocConsumer<CartCubit,CartStates>(
            listener: (BuildContext context, state) {
              if(state is SubmitSuccess){
             //   Navigator.pushNamed(context, orderDetails);

                Navigator.push(context, MaterialPageRoute(builder: (_)=>
                    ConfermOrder(CartCubit.get(context).gettotal(cartList))));
             //   CartCubit.get(context).getCartItems();

                CartCubit.get(context).getCartItems();

              }

            },
            builder: (BuildContext context, Object? state) {

              if(state is GetCartSuccess){
                cartList=state.cartList;
                return    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsetsDirectional.only(start:27.sp,end: 15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.sp,),
                          CustomText(text: 'Heaven\'s Food'.tr(),fontWeight: FontWeight.bold,txtSize: 13.sp,),
                          CustomListTile(text: 'Delivery / As Soon As Possible'.tr(),icon: Icons.alarm,),
                          InkWell(
                            onTap: (){
                              //LocationCubit.get(context).getLocation();
                              Navigator.pushNamed(context, location);

                            },
                            child: CustomListTile(

                              text: LocationCubit.get(context).street==null?'get Location'.tr():
                              LocationCubit.get(context).street.toString()
                              ,icon: Icons.location_on,

                            ),
                          ),



                        ],),
                    ),

                    Padding(
                      padding:  EdgeInsetsDirectional.only(start:15.sp,),
                      child: Card(
                        elevation: 1,
                        color: Theme.of(context).backgroundColor,
                        child: Padding(
                          padding:  EdgeInsets.all(12.sp),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              CustomText(text: 'Your Order'.tr(),fontWeight: FontWeight.bold,txtSize: 11.sp,),
                              SizedBox(height: 5.sp,),


                              Column(
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 80.sp*state.cartList.length,
                                    child:
                                    ListView.builder(
                                        physics:NeverScrollableScrollPhysics() ,
                                        itemCount: state.cartList.length,
                                        itemBuilder: (context, index) =>OrderItem(
                                          img: state.cartList[index].img,
                                         // count: quantity,

                                         // count: state.cartList[index].quantity!,
                                          // count: CartCubit.get(context).quantity,
                                          deleteFunc: (){
                                            CartCubit.get(context).removeFromCart
                                              (state.cartList[index],state.cartList);
                                          },

                                          itemPrice: state.cartList[index].price,
                                          itemName: state.cartList[index].orderName,
                                          plusFunc: (){

                                            QuantityCubit.get(context).increase(state.cartList[index],state.cartList,context);
//                                        CartCubit.get(context).submitTotalAndQuantity
//                                          (CartCubit.get(context).cartCubit[index].id ,
//                                            CartCubit.get(context).cartCubit[index].quantity);

                                            quantity=state.cartList[index].quantity!;
                                            id=state.cartList[index].id!;

                                          },

                                          minusFunc: (){

                                            QuantityCubit.get(context).decrease(state.cartList[index],state.cartList,context);
                                            quantity=state.cartList[index].quantity!;
                                            id=state.cartList[index].id!;


                                          },
                                          countWidget: BlocConsumer<QuantityCubit,QuantityStates>(
                                            listener: (BuildContext context, state) {  },
                                            builder: (BuildContext context, Object? state) {
                                              if(state is IncreaseState){
                                                CartCubit.get(context).gettotal(cartList);
                                                return
                                                  CustomText(text: state.cart[index].quantity.toString(),fontWeight: FontWeight.bold,txtSize: 11.sp,);

                                              }if(state is DecreaseState){
                                                CartCubit.get(context).gettotal(cartList);

                                                return
                                                  CustomText(text: state.cart[index].quantity.toString(),fontWeight: FontWeight.bold,txtSize: 11.sp,);
                                              }else{
                                                return
                                                  CustomText(text: '1',fontWeight: FontWeight.bold,txtSize: 11.sp,);
                                              }

                                            },),
                                        ) ),
                                  ),
                                  SizedBox(height: 15.sp,),

                                  BlocConsumer<QuantityCubit,QuantityStates>(
                                    listener: (BuildContext context, state) {  },
                                    builder: (BuildContext context, state) {
                                      if(state is IncreaseState||state is DecreaseState){
                                         CartCubit.get(context).gettotal(cartList);
                                      }
                                      return  Column(
                                        children: [
                                          Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          CustomText(text: 'Subtotal'.tr(),txtSize: 11.sp,color: priGrey,),
                                          CustomText(text: CartCubit.get(context).gettotal(cartList)
                                          ,txtSize: 9.sp,color: priGrey),

                                          ],),
                                          SizedBox(height: 7.sp,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(text: 'Delivery'.tr(),txtSize: 11.sp,color: priGrey,),
                                              Container(width: 40.sp,
                                                  height: 15.sp,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    border: Border.all(color: Colors.grey),
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  child: Center(child: CustomText(text: 'free'.tr(),txtSize: 8.sp,color: Colors.grey,textAlign: TextAlign.center,fontWeight: FontWeight.bold,))),

                                            ],),
                                          SizedBox(height: 10.sp,),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(text: 'Total'.tr(),txtSize: 13.sp,fontWeight: FontWeight.bold,),
                                              CustomText(text: CartCubit.get(context).gettotal(cartList)
                                                ,txtSize: 13.sp,fontWeight: FontWeight.bold,),

                                            ],),
                                          SizedBox(height: 5.sp,),
                                        ],
                                      );

                                    },
                                  ),

                                ],
                              ),







                            ],),
                        ),

                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(25.sp),
                      child: CustomButton('Place Order'.tr(), (){
                        if(state.cartList.length==null||state.cartList==0){
                          //  Navigator.pushNamed(context, orderDetails);
                          showToast(msg: 'You must add items'.tr(), state: ToastedStates.ERROR);

                        }
//                    else{
                        //   CartCubit.get(context).submitTotalAndQuantity(id,quantity);
                        CartCubit.get(context).submitTotalAndQuantity(quantity);


                        // }
                        print(quantity);


                      }),
                    ),



                  ],);


              }
              else{
                return Center(child: CircularProgressIndicator());
              }

          }
          ),
        ),


    );
  }
}