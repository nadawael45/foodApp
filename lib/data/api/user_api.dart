import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/models/user_model.dart';

import '../../domain/cubit/location/location_cubit.dart';
import '../../presentation/dialoges/toast.dart';

class UserApi{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;


  addUser(userModel,context)async{
    LocationCubit.get(context).getLocation();
    var street=LocationCubit.get(context).street;
   var  uid=auth.currentUser!.uid;

    await firestore.collection('users').doc(uid).set(userModel.toJson(street,uid)
//        +
//
//        {
//          'location':street,
//          'id':auth.currentUser!.uid
//    }
    );
    
  }
  getUser(UserModel userModel)async{
    return firestore.collection('users').doc(auth.currentUser!.uid).get()
    .then((value) => {
      userModel=UserModel.fromJson(value.data()!),
      userModel.id=int.parse(value.id),



    }).catchError((onError){

      showToast(msg: onError.toString(), state: ToastedStates.ERROR);

    });

  }
}