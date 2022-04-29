import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/data/models/favModel.dart';
import 'package:fitandfresh/data/models/product.dart';

class FavRepo{

  FavRepo();

 Stream<List<OrderModel>> getFavItems(){
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var  userId=  auth.currentUser!.uid;
    return   firestore.collection('users')
        .doc(userId)
        .collection('Favourites')
        .snapshots().map((event)  {
      final List<OrderModel>favList=[];

    for(var element in  event.docs){
        OrderModel  fav=OrderModel.fromfavJson(element.data());
        fav.favId=element.id;
    favList.add(fav.copyFavWith(favId: element.id));



    }
    return favList;

    });

  }





//
//        .then((value){
//          print(value);
//          print(value.docs);
//      value.docs.forEach((element){
//        print(element.data());
//
//        OrderModel fav =OrderModel.fromfavJson(element.data());
//
//        fav.favId=element.id;
//        favList.add(fav);
//
//      });
//      return favList;
//
//    });
//  }



}