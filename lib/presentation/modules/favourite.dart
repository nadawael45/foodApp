import 'package:fitandfresh/data/models/favModel.dart';
import 'package:fitandfresh/data/models/product.dart';
import 'package:fitandfresh/domain/cubit/favourite/fav_cubit.dart';
import 'package:fitandfresh/domain/cubit/favourite/fav_states.dart';
import 'package:fitandfresh/presentation/widgets/custom_card.dart';
import 'package:fitandfresh/shared/constants/images.dart';
import 'package:fitandfresh/shared/constants/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_scaffold.dart';
import'package:easy_localization/easy_localization.dart';
class Favourite extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  //List<FavModel> gridList = [];
  OrderModel orderMod=OrderModel();
  var key1=GlobalKey();
  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      boolAppBar:true,  text: 'Favourites'.tr(),prefixIcon: Icons.arrow_back,
      prefixFunction: ()=>Navigator.of(context).popAndPushNamed(homepath),


      body:

      BlocConsumer<FavCubit,FavStates>(
    listener: (BuildContext context, state) {

    },

        builder: (BuildContext context, state) {
          if(state is GetFavSuccess){
            return Sizer(
              builder: (BuildContext context, Orientation orientation, DeviceType deviceType)=>
               orientation == Orientation.landscape ?
                GridView.builder(
                   key:key1 ,
                   padding: EdgeInsets.all(8.sp),

                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     crossAxisSpacing: 10.sp,
                     childAspectRatio: 1.2,

                   ),
                   itemCount: state.favList.length,
                   itemBuilder: (context,index)=>Favbody(
                       state.favList[index],220.sp,MediaQuery.of(context).size.width*0.3
                   ))
                    :
               GridView.builder(
                   key:key1 ,
                   padding: EdgeInsets.all(8.sp),

                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     crossAxisSpacing: 10.sp,
                     childAspectRatio: 0.8,

                   ),
                   itemCount: state.favList.length,
                   itemBuilder: (context,index)=>Favbody( state.favList[index],170.sp,50.w

                   ))





            );
          }
          if(state is GetFavFailed){
            return Text('Errrrrrrror');
          }
         else{
            return Center(child: CircularProgressIndicator());
          }



        },

      ), scaffKey: scaffoldKey,
    );
  }
}

class Favbody extends StatelessWidget {
var favlist;
double height;
double width;
Favbody(this.favlist,this.height,this.width);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: height,
      width: width,
      itemName:favlist.itemName!,
      itemPrice:favlist.itemPrice!,
      img: favlist.img!,
      favwidget:   IconButton(
        onPressed: () {
    FavCubit.get(context).removeFav(favlist.favId);

    },
      icon:
      Icon(
        Icons.clear,
        color: Colors.grey,
        size: 14.sp,
      )),


    );
  }
}

