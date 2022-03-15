
import 'package:fitandfresh/data/models/order.dart';
import 'package:fitandfresh/presentation/modules/orderScreen.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custum_product_streambuilder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/category.dart';
import '../../domain/cubit/dark_mode/dark_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../dialoges/drawer.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_scaffold.dart';
class HomePage extends StatelessWidget {
   GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
       backgroundColor: DarkModeCubit.get(context).isDark
           ? Colors.black
           : backgroungd,
       drawerEnableOpenDragGesture: false,
       drawer: CustomDrawer(),
       appBar: PreferredSize(
         preferredSize: Size(100.h, 17.h,),
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
           child: Container(
             color:  DarkModeCubit.get(context).isDark
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
                   text: 'Home',
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
       body: SingleChildScrollView(
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
                      text: 'category',
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
                                text: 'best seller',
                                fontWeight: FontWeight.bold,
                                txtSize: 12.sp,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushNamed(seeAll);
                                },
                                child: CustomText(
                                  text: 'see more',
                                  color: Colors.black,
                                  txtSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.sp,),

                          Container(
                            height: 160.sp,
                            width: double.infinity,
                            child: CustomStreamBuilder(orderList: orderList,
                              widget: ListView.builder(
                                itemCount:orderList.length ,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) =>
                                    CustomCard(
                                        function: (){
                                          Navigator.push(context, MaterialPageRoute
                                            (builder: (_)=>OrderScreen(orderList[index])));
                                        },
                                        colorIcon: Colors.red,
                                        badgeIcon: Icons.favorite,
                                        itemName: orderList[index].itemName,
                                        img: orderList[index].img,
                                        itemPrice: orderList[index].itemPrice),

                              ),
                            ),
                          ),                          SizedBox(height: 12.sp,),
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
                                              text: 'Healthy Food \n For Busy People',
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
                                                    text: 'View Our Menu',
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
                                text: 'new arrival',
                                fontWeight: FontWeight.bold,
                                txtSize: 12.sp,
                              ),
                              CustomText(
                                text: 'see more',
                                color: Colors.black,
                                txtSize: 10.sp,
                              ),
                            ],
                          ),
                          SizedBox(height: 3.sp,),
                          Container(
                            height: 160.sp,
                            width: double.infinity,
                            child: CustomStreamBuilder(orderList: orderList,
                              widget: ListView.builder(
                                itemCount:orderList.length ,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) =>
                                    CustomCard(
                                      function: (){
                                        Navigator.push(context, MaterialPageRoute
                                          (builder: (_)=>OrderScreen(orderList[index])));
                                      },
                                        colorIcon: Colors.red,
                                        badgeIcon: Icons.favorite,
                                        itemName: orderList[index].itemName,
                                        img: orderList[index].img,
                                        itemPrice: orderList[index].itemPrice),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}