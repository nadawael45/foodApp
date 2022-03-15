import 'package:fitandfresh/presentation/widgets/custom_card.dart';
import 'package:fitandfresh/shared/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/meal.dart';
import '../widgets/custom_scaffold.dart';
class Favourite extends StatelessWidget {
  var key1=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolAppBar:true,  text: 'Favourites',prefixIcon: Icons.arrow_back,


      body:
      GridView.builder(
        key:key1 ,
        padding: EdgeInsets.all(8.sp),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
           crossAxisSpacing: 10.sp,
            childAspectRatio: 0.8,

          ),
          itemCount: gridList.length,
          itemBuilder: (context,index)=>Container(
            height: 150.sp,
            child: CustomCard(
              colorIcon: Colors.grey,
              badgeIcon: Icons.clear,
              itemName: gridList[index].itemName,
              itemPrice: gridList[index].itemPrice,
              img: gridList[index].img,
            ),
          ))
    );
  }
}

List<Meal> gridList = [
  Meal(img: mix1, itemName: 'mix grill', itemPrice: '115'),
  Meal(img: mix2, itemName: 'mix seafood', itemPrice: '115'),
  Meal(img: mix1, itemName: 'mix grill', itemPrice: '115'),
  Meal(img: mix2, itemName: 'mix seafood', itemPrice: '115')

];