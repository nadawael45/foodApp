import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import 'custom_text.dart';
class CustomOrder extends StatelessWidget {
  String? img;
  String? itemName;
  String? itemPrice;
  String?date;


  CustomOrder({this.img, this.itemName, this.itemPrice,this.date});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 18.sp,top: 20.sp,end: 18.sp),
      child: Container(
        width:100.w,
        height: 100.sp,
        child: Card(
          color: Theme.of(context).backgroundColor,
          elevation: 0,
          child: Container(
            width:100.w,
            height: 100.sp,
            child: Row(
              children: [
                Image.asset(img!,fit: BoxFit.fill,
                  height: 100.sp,width: 100.sp,

                ),
                SizedBox(width: 7.sp,),

                Expanded(
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(end: 8.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: itemName,fontWeight: FontWeight.bold,txtSize: 12.sp,),
                            Icon(Icons.delete,color: Colors.grey.shade800,size: 20.sp,),

                          ],
                        ),
                        SizedBox(height: 4.sp,),
                        CustomText(text: 'delivered',txtSize:8.sp ,color: priGreen,fontWeight: FontWeight.bold,),
                        SizedBox(height: 4.sp,),
                        CustomText(text: date,txtSize:11.sp ,),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              Icon(Icons.refresh,color: priGreen,),
                              CustomText(text: 'Re-order',txtSize:11.sp ,color: priGreen,fontWeight: FontWeight.bold,),

                            ],),
                        )


                      ],),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
