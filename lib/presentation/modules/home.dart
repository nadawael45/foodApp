import 'package:badges/badges.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_cubit.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_states.dart';
import 'package:fitandfresh/presentation/modules/cart.dart';
import 'package:fitandfresh/presentation/modules/favourite.dart';
import 'package:fitandfresh/presentation/modules/home_page.dart';
import 'package:fitandfresh/presentation/modules/setting.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import '../widgets/custom_scaffold.dart';


class HomeScreen extends StatelessWidget {
  var count=0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child:
      BlocBuilder<CartCubit,CartStates>(

        builder: (BuildContext context, state) {
          if(state is GetCartSuccess){
            count=state.cartList.length;
          }
            return HomeScaff(count);


        },

      ),
    );
  }
}

List pageList=[
  HomePage(),
  Favourite(),
  Cart(),
  Setting()
];

class HomeScaff extends StatefulWidget {
  int? count;
  HomeScaff(this.count);

  @override
  State<HomeScaff> createState() => _HomeScaffState();
}

class _HomeScaffState extends State<HomeScaff> {
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        selectedItemColor: priGreen,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        iconSize: 30,
        onTap: (val){
          setState(() {
            index=val;

          });
          print(index);
        },
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home,),label: '' ),
          BottomNavigationBarItem(icon:Icon(Icons.favorite_border) ,label: ''),
          BottomNavigationBarItem(icon:Badge(
              badgeColor: priGreen,

              badgeContent: Center(child: CustomText(text: widget.count.toString(),color: Colors.white,txtSize: 7.sp,)),
              child: Icon(Icons.shopping_cart)), label: ''),
          BottomNavigationBarItem(icon:Icon(Icons.settings) ,label: ''),

        ],),
      backgroundColor: backgroungd,
      body:pageList[index],

    );
  }
}

