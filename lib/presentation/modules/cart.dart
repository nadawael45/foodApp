
import 'package:fitandfresh/data/models/order.dart';
import 'package:fitandfresh/presentation/widgets/custom_list_tile.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/location/location_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/item_order.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolAppBar: true,
        text: 'Order Details',prefixIcon: Icons.arrow_back,suffixIcon: Icons.help,
        prefixFunction: (){
          Navigator.of(context).pop();
        },



      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding:  EdgeInsetsDirectional.only(start:27.sp,end: 15.sp),
              child: Column(        crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 8.sp,),
                CustomText(text: 'Heaven\'s Food',fontWeight: FontWeight.bold,txtSize: 13.sp,),
                CustomListTile(text: 'Delivery / As Soon As Possible',icon: Icons.alarm,),

                  InkWell(
                    onTap: (){
                      //LocationCubit.get(context).getLocation();
                      Navigator.pushNamed(context, location);

                    },
                    child: CustomListTile(

                    text: LocationCubit.get(context).street==null?'get Location':
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
                      CustomText(text: 'Your Order',fontWeight: FontWeight.bold,txtSize: 11.sp,),
                        SizedBox(height: 5.sp,),
                        Container(
                          width: 100.w,
                          height: 72.sp*orderList.length,
                          child: ListView.builder(
                            physics:NeverScrollableScrollPhysics() ,
                            itemCount: orderList.length,
                              itemBuilder: (context, index) =>OrderItem(
                                img: orderList[index].img,
                                itemPrice: orderList[index].itemPrice,
                                itemName: orderList[index].itemName,
                                count: 2,
                              ) ),
                        ),
                        SizedBox(height: 7.sp,),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'Subtotal',txtSize: 11.sp,color: priGrey,),
                          CustomText(text: '230 EGP',txtSize: 9.sp,color: priGrey),

                        ],),
                        SizedBox(height: 7.sp,),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'Delivery',txtSize: 11.sp,color: priGrey,),
                          Container(width: 40.sp,
                              height: 15.sp,
                              decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                              child: Center(child: CustomText(text: 'free',txtSize: 8.sp,color: Colors.grey,textAlign: TextAlign.center,fontWeight: FontWeight.bold,))),

                        ],),
                        SizedBox(height: 10.sp,),

                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: 'total',txtSize: 13.sp,fontWeight: FontWeight.bold,),
                          CustomText(text: '230 EGP',txtSize: 13.sp,fontWeight: FontWeight.bold,),

                        ],),
                        SizedBox(height: 5.sp,),



                      ],),
                  ),

                ),
              ),
              Padding(
                padding:  EdgeInsets.all(25.sp),
                child: CustomButton('Place Order', (){
                  Navigator.pushNamed(context, orderDetails);
                }),
              ),



            ],),
        ),


    );
  }
}