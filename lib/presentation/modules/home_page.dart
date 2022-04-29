
import 'package:fitandfresh/data/models/favModel.dart';
import 'package:fitandfresh/data/models/product.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_cubit.dart';
import 'package:fitandfresh/domain/cubit/favourite/fav_cubit.dart';
import 'package:fitandfresh/domain/cubit/favourite/fav_states.dart';
import 'package:fitandfresh/domain/cubit/pregress_hud/progress_cubit.dart';
import 'package:fitandfresh/domain/cubit/product/product_cubit.dart';
import 'package:fitandfresh/domain/cubit/product/product_states.dart';
import 'package:fitandfresh/presentation/modules/orderScreen.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custum_product_streambuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import '../../data/local/cacheHelper.dart';
import '../../data/models/cart.dart';
import '../../data/models/category.dart';
import '../../domain/cubit/cart/cart_states.dart';
import '../../domain/cubit/dark_mode/dark_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../dialoges/drawer.dart';
import '../dialoges/toast.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_scaffold.dart';
class HomePage extends StatelessWidget {

   GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
   var value;
   int quantity=1;
  bool loading= false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
       backgroundColor: CacheHelper.getBool('isDark')
           ? Colors.black
           : backgroungd,
       drawerEnableOpenDragGesture: false,
       drawer: CustomDrawer(),
       appBar: PreferredSize(
         preferredSize: Size(100.h, 17.h,),
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
           child: Container(
             color:  CacheHelper.getBool('isDark')
                 ? Colors.grey.shade800
                 : Colors.white,
             child:
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 IconButton(
                     onPressed: (){
                      scaffoldKey .currentState!.openDrawer();
                     },
                     icon: Icon(
                       Icons.menu,
                       color: Colors.black,
                     )),
                 CustomText(
                   fontWeight: FontWeight.bold,
                   text: 'Home'.tr(),
                   txtSize: 13.sp,
                 ),
                 IconButton(
                     onPressed: (){},
                     icon: Icon(
                       Icons.search,
                       color: Colors.black,
                     )),
               ],
             ),
           ),
         ),
       ),
       body: ModalProgressHUD(
         inAsyncCall: ProgressHudCubit.get(context).loading
         ,
         child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 18.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.sp),
                      ),
                      CustomText(
                        text: 'category'.tr(),
                        fontWeight: FontWeight.bold,
                        txtSize: 12.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.sp),
                      ),
                      Container(
                        height:  130.sp,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) =>
                              ListView.builder(
                                  itemCount: categoryList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding:
                                    EdgeInsetsDirectional.only(end: 10.sp),
                                    child: Container(
                                        width: 100.sp,
                                        decoration: BoxDecoration(
                                            color: categoryList[index].color,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10.sp),
                                              child: CustomText(
                                                text: categoryList[index].text,
                                                fontWeight: FontWeight.bold,
                                                txtSize: 12.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  height:
                                                  constraints.maxHeight *
                                                      0.7,
                                                  width: constraints.maxWidth *
                                                      0.7,
                                                  child: Image.asset(
                                                      categoryList[index]
                                                          .img!)),
                                            ),
                                          ],
                                        )),
                                  )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 20.sp),
                        child: Column(
                          children: [
                            SizedBox(height: 15.sp,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'best seller'.tr(),
                                  fontWeight: FontWeight.bold,
                                  txtSize: 12.sp,
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(seeAll);
                                  },
                                  child: CustomText(
                                    text: 'see more'.tr(),
                                    txtSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.sp,),
                            ProductRow(quantity: quantity,),
                            SizedBox(height: 12.sp,),
                            Container(
                              width: double.infinity,
                              height: 100.sp,
                              decoration: BoxDecoration(
                                  color: priGreen,
                                  borderRadius: BorderRadius.circular(12)),
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) =>
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.only(
                                                  start: 20.sp,
                                                  top: 20.sp,
                                                  bottom: 10.sp),
                                              child: CustomText(
                                                text: 'Healthy Food \n For Busy People'.tr(),
                                                textAlign: TextAlign.start,
                                                fontWeight: FontWeight.bold,
                                                txtSize: 14.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.only(
                                                  start: 8.sp,bottom: 3.sp),
                                              child: Container(
                                                height: 20.sp,
                                                width: 80.sp,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                    BorderRadius.circular(20)),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(2),
                                                    child: CustomText(
                                                      text: 'View Our Menu'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      txtSize: 8.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Align(alignment: AlignmentDirectional.centerEnd,
                                          child: Container(
                                              height:100.sp,
                                              child: Image.asset(
                                                healthyfood,
                                                height: 100.sp,
                                              )),
                                        ),
                                      ],
                                    ),
                              ),
                            ),
                            SizedBox(height: 10.sp,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'new arrival'.tr(),
                                  fontWeight: FontWeight.bold,
                                  txtSize: 12.sp,
                                ),
                                CustomText(
                                  text: 'see more'.tr(),
                                  txtSize: 10.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 3.sp,),
                            ProductRow(quantity: quantity),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
       ),

    );
  }
}

class ProductRow extends StatelessWidget {
   ProductRow({
    Key? key,
    required this.quantity,
  //  required this.loadingProgress,

  }) : super(key: key);

  final int quantity;
  List<CartModel> cartlist=[];
   List<OrderModel> orderlist=[];

   //  bool loadingProgress;


  @override
  Widget build(BuildContext context) {


    return Container(
      height: 160.sp,
      width: double.infinity,
      child:

        BlocConsumer<ProductCubit,ProductStates>(
      listener: (BuildContext context, state) {

      },


      builder: (BuildContext context, state) {
          if (state is GetProductSuccess) {
           orderlist=state.proList;
            return BlocConsumer<CartCubit, CartStates>(
              listener: (BuildContext context, state) {},
              builder: (BuildContext context, state) {
                if (state is GetCartSuccess) {
                  cartlist=  state.cartList;
                }
                return ListView.builder(
                  itemCount: orderlist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var orderId = orderlist[index].id;
                    var orderIndex = orderlist[index];

                    return CustomCard(

                      addCartFunc: () {
                        addCartFunction(orderlist[index], context, quantity,cartlist);
                      },
                      function: () {
                        Navigator.push(context, MaterialPageRoute
                          (builder: (_) => OrderScreen(orderlist[index])));
                      },
                      colorIcon: orderlist[index].isFavourite ?
                      Colors.red : Colors.grey,
                      id: orderlist[index].id,
                      badgeIcon: orderlist[index].isFavourite ?
                      Icons.favorite : Icons.favorite_border,
                      itemName: orderlist[index].itemName,
                      img: orderlist[index].img,
                      itemPrice: orderlist[index].itemPrice,
//                           favFunc: () =>addFavFunction(context, state.proList[index]),
                      favwidget:
                      BlocConsumer<FavCubit, FavStates>(
                          listener: (BuildContext context, state) {

                          },
                          builder: (BuildContext context, Object? state) {
                            if (state is GetFavSuccess) {

                              for (var element in state.favList) {
                                if (element.id!.contains(orderId)) {
                                  return IconButton(
                                      onPressed: () {
                                        FavCubit.get(context).removeFav(element.favId!);


                                      },
                                      icon:
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 14.sp,
                                      ));
                                }
                              }
                              return IconButton(
                                  onPressed: () {
                                    FavCubit.get(context).addFav(FavModel(orderModel:orderIndex),);

                                  },
                                  icon:
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                    size: 14.sp,
                                  ));
                            }

                            else{
                              return Center(child: CircularProgressIndicator());

                            }

                          }),
                    );
                  },);
              },


              );
          }
          if(state is GetProductFailed){
            return Center(child: CustomText(text: state.error.toString(),));

          }else{
            return CircularProgressIndicator(
              value: 0.1,
            );
          }
        }),


            );

          }


}


addCartFunction(orderListIndex,context,quantity,cartCubit){
  print(orderListIndex.id);
  print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
  print(cartCubit.length);
  if(cartCubit.length==0||cartCubit.length==null){
    CartCubit.get(context).addToCart(CartModel(
        quantity: quantity,
        total:   int.parse(orderListIndex.itemPrice!),
        orderName:orderListIndex.itemName,
        date: DateTime.now().toString(),
        price: orderListIndex.itemPrice,
        img: orderListIndex.img,
        productId: orderListIndex.id!));
  }
  else{
    for(var element in cartCubit){
      print(element.productId);

      if(element.productId!.contains(orderListIndex.id!)){
         return showToast(msg: 'Already Exist'.tr(), state: ToastedStates.WARNING);

      }

    }
       CartCubit.get(context).addToCart(CartModel(
        quantity: quantity,
        total:   int.parse(orderListIndex.itemPrice!),
        orderName:orderListIndex.itemName,
        date: DateTime.now().toString(),
        price: orderListIndex.itemPrice,
        img: orderListIndex.img,
        productId: orderListIndex.id!));


  }
 // CartCubit.get(context).cartCubit.clear();
}



