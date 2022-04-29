import 'package:expandable/expandable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import '../widgets/custom_scaffold.dart';
class OrderScreen extends StatefulWidget {
  var orderItem;


  OrderScreen(this.orderItem);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

//  bool riceBox=false;
//  bool saladeBox=false;
//  bool potatoBox=false;
//  bool pastaBox=false;

  @override
  Widget build(BuildContext context) {
    return
      CustomScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: double.infinity,height: 30.h,
                decoration: BoxDecoration(
                    image: DecorationImage(

                      image: NetworkImage(widget.orderItem!.img.toString(),),fit: BoxFit.fill)
                ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 7.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackButton(color: Colors.white,),
                        Icon(Icons.favorite_border,color: Colors.white,),
                      ],
                    ),
                  )
              ),
              Padding(
                padding:  EdgeInsets.only(right: 13.sp,left: 13.sp,top: 13.sp,bottom: 5.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  CustomText(text: widget.orderItem!.itemName.toString(),fontWeight: FontWeight.bold,txtSize: 20.sp,),
                  CustomText(text: widget.orderItem!.desc.toString(),txtSize: 8.sp,textAlign: TextAlign.start,),
                    SizedBox(height: 10.sp,),

                    Row(
                      children: [
                        Circle(num: widget.orderItem.calory,text: 'calories'.tr(),),
                        Circle(num: widget.orderItem.fat,text: 'fat'.tr(),),
                        Circle(num: widget.orderItem.carb,text: 'carb'.tr(),),
                        Circle(num: widget.orderItem.protein,text: 'protein'.tr(),),


                      ],
                    ),




                  ],),

              ),


              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,

                    borderRadius:BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.sp),
                    child: ExpandablePanel(

                      theme: ExpandableThemeData(

                          iconColor: priGreen,
                          expandIcon: Icons.arrow_circle_down,
                          collapseIcon: Icons.arrow_circle_up
                      ),
                      header: CustomText(text: 'Side 1'.tr(),fontWeight: FontWeight.bold,txtSize: 15.sp,textAlign: TextAlign.start,),
                      collapsed:  CustomText(text:'Required'.tr(),color: priGrey,txtSize: 9.sp,),
                      expanded: Column(
                        children: [
                          Divider(thickness: 2,),
                          Sides()

                        ],
                      ),

                    ),
                  ),


                ),
              ),
              Padding(
                padding:  EdgeInsets.all(5.sp),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,

                    borderRadius:BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.sp),
                    child: ExpandablePanel(

                      theme: ExpandableThemeData(

                          iconColor: priGreen,
                          expandIcon: Icons.arrow_circle_down,
                          collapseIcon: Icons.arrow_circle_up
                      ),
                      header: CustomText(text: 'Side 2'.tr(),fontWeight: FontWeight.bold,txtSize: 15.sp,textAlign: TextAlign.start,),
                      collapsed:  CustomText(text:'Required'.tr(),color: priGrey,txtSize: 9.sp,),
                      expanded: Column(
                        children: [
                          Divider(thickness: 2,),
                          Sides()


                        ],
                      ),

                    ),
                  ),


                ),
              ),
              SizedBox(height: 5.sp,),

              Padding(
                padding:  EdgeInsets.all(8.sp),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,

                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(


                   decoration: InputDecoration(
                     contentPadding: EdgeInsets.all(10.sp),

                     hintText: 'Comment for Ordering'.tr(),
                       hintStyle: TextStyle(fontSize: 10.sp),

                       border: OutlineInputBorder(

                   borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 0,),
                    borderRadius: BorderRadius.circular(29),


                  ) ,
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 0,),
                       borderRadius: BorderRadius.circular(50),
                     ),
                     focusedBorder: OutlineInputBorder(

                       borderSide: BorderSide(color: Theme.of(context).backgroundColor, width: 0,),

                     ),

                   ),
                  ),
                ),
              ),
              SizedBox(height: 10.sp,),
              Padding(
                padding:  EdgeInsets.all(18.sp),
                child: CustomButton(
                'Add To Cart'.tr()+ ' - ${widget.orderItem!.itemPrice} Egyp'
                , (){}),
              )


            ],
          ),
        ), scaffKey: scaffoldKey,
      );
  }
}

class Circle extends StatelessWidget {
  var text;
  var num;
   Circle({
    this.text,this.num,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: 100.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: priGreen,
              ),
            ),
            Positioned(
              right: 17.sp,
              child: Container(
                width: 50.sp,
                height: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).backgroundColor
                ),
                child: Align(alignment: Alignment.center,
                    child: CustomText(text: num,)),
              ),
            ),

          ],),
          SizedBox(height: 5.sp,),
          CustomText(text: text,),
        ],
      ),
    );
  }
}
class Sides extends StatefulWidget {
  @override
  State<Sides> createState() => _SidesState();
}

class _SidesState extends State<Sides> {
  bool riceBox=false;
  bool saladeBox=false;
  bool potatoBox=false;
  bool pastaBox=false;

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text:'rice' .tr(),fontWeight: FontWeight.bold),
              Checkbox( fillColor: MaterialStateProperty.all(priGrey),
                  focusColor: priGreen,
                  value: riceBox, onChanged: (bool){setState(() {
                    riceBox=bool!;
                  });}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text:'pasta'.tr() ,fontWeight: FontWeight.bold),
              Checkbox( fillColor: MaterialStateProperty.all(priGrey),
                  focusColor: priGreen,
                  value: pastaBox, onChanged: (bool){setState(() {
                    pastaBox=bool!;
                  });}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text:'salade'.tr() ,fontWeight: FontWeight.bold),
              Checkbox( fillColor: MaterialStateProperty.all(priGrey),
                  focusColor: priGreen,
                  value: saladeBox, onChanged: (bool){setState(() {
                    saladeBox=bool!;
                  });}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text:'potato'.tr() ,fontWeight: FontWeight.bold),
              Checkbox( fillColor: MaterialStateProperty.all(priGrey),
                  focusColor: priGreen,
                  value: potatoBox, onChanged: (bool){setState(() {
                    potatoBox=bool!;
                  });}),
            ],
          ),        ],
      );
  }
}

