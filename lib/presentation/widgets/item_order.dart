import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants/colors.dart';
class OrderItem extends StatelessWidget {
  String? img;
  String? itemName;
  String? itemPrice;
  int? count=1;
  var minusFunc;
  var plusFunc;

  OrderItem({this.img, this.itemName, this.itemPrice,this.count,this.minusFunc,this.plusFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.sp,),

          Row(
            children: [
              Image.asset(img!,height: 70.sp,width: 71.sp,),
            ],
          ),
          SizedBox(width: 7.sp,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            CustomText(text: itemName,fontWeight: FontWeight.bold,txtSize: 10.sp,),
              SizedBox(height: 4.sp,),

              CustomText(text: itemPrice,txtSize:8.sp ,),

          ],),
          Spacer(),
          Row(
            children: [
              InkWell(
                onTap: minusFunc,
                  child: Container(
                    color: Colors.grey,
                    child: Center(child: Icon(Icons.remove,color: Colors.white,)),
                  )),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                child: Center(child: CustomText(text: count.toString(),fontWeight: FontWeight.bold,txtSize: 11.sp,)),
              ),
              InkWell(
                  onTap: plusFunc,
                  child: Container(
                    color: priGreen,
                    child: Center(child: Icon(Icons.add,color: Colors.white,)),
                  )),
            ],
          ),
          SizedBox(width: 7.sp,),
          Icon(Icons.delete,color: Colors.grey,)

      ],),
    );
  }
}
