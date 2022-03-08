import 'package:badges/badges.dart';
import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/presentation/widgets/custom_iconbutton.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../domain/cubit/dark_mode/dark_cubit.dart';
class CustomCard extends StatelessWidget {
   String? img;
   String? itemName;
   String? itemPrice;
   Color? colorIcon;
   IconData? badgeIcon;


   CustomCard({this.img, this.itemName, this.itemPrice,this.badgeIcon,this.colorIcon});

   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160.sp,

          child:

             Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color:  DarkModeCubit.get(context).isDark
                  ? Colors.grey.shade800
                  : Colors.white,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) =>

                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.asset(
                      '$img',
                      fit: BoxFit.fill,
                      height: 100.sp,
                      width: constraints.maxWidth,
                    ),
                    SizedBox(height: 6,),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 10.sp),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(fontWeight: FontWeight.bold,
                                color: DarkModeCubit.get(context).isDark
                                    ? Colors.white
                                    : Colors.black,
                                text: itemName,),
                              RatingBar.builder(
                                initialRating: 4.5,
                                // minRating: 1,
                                direction: Axis.horizontal,
                                itemSize:13 ,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(height: 4.sp,),
                              Row(
                                children: [
                                  CustomText(fontWeight: FontWeight.bold,color: priGreen,text: itemPrice,),
                                  CustomText(fontWeight: FontWeight.bold,color:
                                  DarkModeCubit.get(context).isDark
                                      ? Colors.white
                                      : Colors.black,
                                    text: ' EGP',),

                                ],
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding:  EdgeInsetsDirectional.only(end: 8.sp),
                          child: CustomBtnIcon(icon:Icon(Icons.add_shopping_cart,color: Colors.white,size: 20,) ,color: priGreen,),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),

        ),
        Padding(
          padding:  EdgeInsets.all(8.0.sp),
          child: Container(
            width:25.sp,
            height: 23.sp,
            child: Badge(
              elevation: 0,
              position: BadgePosition.topStart(),
              padding: EdgeInsets.all(0),
              badgeColor: Colors.white60,
              badgeContent: IconButton(
                  onPressed: () {},
                  icon:
                  Icon(
                    badgeIcon,
                    color: colorIcon,
                    size: 14.sp,
                  )),

            ),
          ),
        ),
      ],
    );
  }
}
