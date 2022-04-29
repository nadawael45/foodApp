import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/api/fav_api.dart';
import 'package:fitandfresh/data/repository/fav_repo.dart';
import 'package:fitandfresh/domain/cubit/favourite/fav_states.dart';
import 'package:fitandfresh/presentation/dialoges/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart.dart';
import '../../../data/models/favModel.dart';
import '../../../data/models/product.dart';

class FavCubit extends Cubit<FavStates> {
  FavCubit() : super(InitialFav());

  static FavCubit get(context) => BlocProvider.of(context);
  late final StreamSubscription<List<OrderModel>>subscription;

  FavApi favApi = FavApi();
//  List<OrderModel>favcubit = [];

  addFav(FavModel favModel) {
    favApi.addToFav(favModel).then((value) {
    //  emit(AddedFavSuccess());
     //  favList.add(favModel);
      showToast(msg: 'fav', state: ToastedStates.SUCCESS);
    }).catchError((onError) {
    //  emit(AddedFavFailed());

      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
    });
  }

  getMyFav() {
    emit((LoadingFav()));

    try{

      subscription=
      FavRepo().getFavItems().listen((event) {
//        if(event==null){
//          print('eventnull');
//        }

        emit(GetFavSuccess(event));
        showToast(msg: 'getFavourite', state: ToastedStates.SUCCESS);
      }
      )

        ..onError((onError) {
        emit(GetFavFailed());
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        print(onError);
      });
    }catch(e){
      print(e);
    }


//    FavRepo favRepo = FavRepo(favcubit);
//    favRepo.getFavItems().then((val) {
//      favcubit = val;
//      emit(GetFavSuccess());
//      print('sssssssssssssssssssssssssssssssssss');
//      print(favcubit.length);
//    }).catchError((onError) {
//      emit(GetFavFailed());
//      showToast(msg: onError.toString(), state: ToastedStates.ERROR);
//      print(onError);
//    });
  }

  removeFav(id)async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var  userId=  auth.currentUser!.uid;
    return   firestore.collection('users')
        .doc(userId)
        .collection('Favourites')
        .doc(id)
        .delete().then((val){
      showToast(msg: 'delete', state: ToastedStates.SUCCESS);

   //   emit(DeleteSuccess());

    }).catchError((e){
      showToast(msg: e, state: ToastedStates.ERROR);


    });
  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }

}