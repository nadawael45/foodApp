
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
class OrderItem extends StatefulWidget {
  String? img;
  int count;
  String? itemName;
  String? itemPrice;
 var countWidget;

  var minusFunc;
  var plusFunc;
  var deleteFunc;



  OrderItem({this.img, this.itemName, this.itemPrice,this.count=1,this.minusFunc,this.plusFunc,this.deleteFunc,this.countWidget});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25.sp,),

            Row(
              children: [
                Image.network(widget.img!,height: 70.sp,width: 71.sp,fit: BoxFit.fill,),
              ],
            ),
            SizedBox(width: 11.sp,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              CustomText(text: widget.itemName,fontWeight: FontWeight.bold,txtSize: 10.sp,),
                SizedBox(height: 4.sp,),

                CustomText(text: widget.itemPrice,txtSize:8.sp ,),

            ],),
            Spacer(),
            Row(
              children: [
                InkWell(
                  onTap:widget.minusFunc,

                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Icon(Icons.remove,color: Colors.white,)),
                    )),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Center(child: widget.countWidget

                  //CustomText(text: widget.count.toString(),fontWeight: FontWeight.bold,txtSize: 11.sp,)

                  ),
                ),
                InkWell(
                    onTap: widget.plusFunc,

                child: Container(
                      color: priGreen,
                      child: Center(child: Icon(Icons.add,color: Colors.white,)),
                    )),
              ],
            ),
            SizedBox(width: 7.sp,),
            InkWell(
                onTap: widget.deleteFunc,
                child: Icon(Icons.delete,color: Colors.grey,))

        ],),
      ),
    );
  }
}
