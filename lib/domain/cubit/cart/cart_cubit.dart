import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/api/cart_api.dart';
import 'package:fitandfresh/data/models/cart.dart';
import 'package:fitandfresh/data/repository/cart_repo.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_states.dart';
import 'package:fitandfresh/presentation/dialoges/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/myOrder_repo.dart';


class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitCart());
  static CartCubit get(context) => BlocProvider.of(context);
  late final StreamSubscription<List<CartModel>>subscription;

 // List<CartModel> cartCubit=[];
  List<CartModel> myOrderCubit=[];

  CartModel? cartModel;
  num total = 0;
  CartApi cartApi=CartApi();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;


    addToCart(CartModel cartModel)async{
      emit(InitCart());

      cartApi.addToCart(cartModel).then((val){
        showToast(msg: 'Added successfully', state: ToastedStates.SUCCESS);

     //   emit(AddedCartSuccess());

      }).catchError((onError){
      // emit(AddedCartFailed());
       showToast(msg: onError, state: ToastedStates.ERROR);
       print(onError);
     });


    }

    getCartItems(){
      emit((LoadingCart()));
      subscription=
      CartRepo().getAllCartItems().listen((event) {


        emit(GetCartSuccess(event));
       showToast(msg: 'getCartSuccess', state: ToastedStates.SUCCESS);
      }
      )

        ..onError((onError) {
          emit(GetCartFailed());
          showToast(msg: onError.toString(), state: ToastedStates.ERROR);
          print(onError);
        });
//      CartRepo cartRepo=CartRepo(cartCubit);
//      cartRepo.getAllCartItems().then((val){
//        cartCubit=val;
//        emit(GetCartSuccess());
//        print('lllllllllllllllllllllllllllllllllllllllllllllll');
//        print(cartCubit.length);
//
//      }).catchError((onError){
//        emit(GetCartFailed());
//        showToast(msg: onError, state: ToastedStates.ERROR);
//        print(onError);
//      });

    }


    
    removeFromCart(itemIndex,cartCubit)async{
  cartApi.removeFromCart(itemIndex).then((val){
   // emit(DeleteItemCart());

  });
  gettotal(cartCubit);
    }

    gettotal(cartCubit){

      total=0;
        for(var i=0;i<cartCubit.length;i++){
          if(int.parse(cartCubit[i].price!)==null){
            cartCubit[i].price='0';
          }
       total+=int.parse(cartCubit[i].price!)* cartCubit[i].quantity!
       ;

    }
    print(total);

    return total.toString();
  }


  submitTotalAndQuantity(quantity)async{
    var  userId=  auth.currentUser!.uid;
     await firestore.collection('Cart').doc(userId).set({'Total':total,}).then((value) => {

       showToast(msg: 'Done', state: ToastedStates.SUCCESS),

       emit(SubmitSuccess())

     });

//      await firestore.collection('Cart').doc(userId).collection('items')
//        .doc(id).update({'Quantity':quantity,}).then((value) => {
//
//      showToast(msg: 'Done', state: ToastedStates.SUCCESS),
//
//          emit(SubmitSuccess())
//
//    });



  }


  removeCartAndCreateOrder({
    String? name,street,location,phone,comment,
    var total,cartCubit})async{

    var  userId=  auth.currentUser!.uid;
    print('userid');
    print(userId);
    print(cartCubit.length);
    await firestore.collection('Cart') .doc(userId).collection('items').get().then((snapshot) => {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete()
      }});
    await firestore.collection('Cart') .doc(userId).delete();


    for(var list in cartCubit ){
      var cartId=   firestore.collection('Orders').doc(userId).collection('items').doc().id;
      await firestore.collection('Orders').doc(userId).collection('items').doc(cartId).set({
          'Quantity':list.quantity,
        'ItemName':list. orderName,
        'Price':list. price,
        'ItemImage': list.img,
        'Id':cartId,
        'ProductId':list.productId,
        });}
    await  firestore.collection('Orders').doc(userId).set({
      'userName':name,
      'userStreet':street,
      'userLocation':location,
      'userPhone':phone,
      'comment':comment,
      'Total':total
    }).then((value) => {
    emit(RemoveCartAddOrder()),
      cartCubit.clear(),
      showToast(msg: 'delete', state: ToastedStates.SUCCESS),



    }).catchError((onError){
      showToast(msg: onError, state: ToastedStates.ERROR);

    });


  }

  getMyOrders(){
    emit((LoadingMyOrders()));
    MyOrderRepo myOrderRepo=MyOrderRepo(myOrderCubit);
    myOrderRepo.getAllOrderItems().then((val){
      myOrderCubit=val;
      emit(GetOrderSuccess());
      print('sssssssssssssssssssssssssssssssssss');
      print(myOrderCubit.length);

    }).catchError((onError){
      emit(GetOrderFailed());
      showToast(msg: onError, state: ToastedStates.ERROR);
      print(onError);
    });

  }


}

