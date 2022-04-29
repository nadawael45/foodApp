import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/api/user_api.dart';
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:fitandfresh/data/models/user_model.dart';
import 'package:fitandfresh/presentation/dialoges/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthStates> {
  EmailAuthCubit() : super(InitialState());
  static EmailAuthCubit get(context) => BlocProvider.of(context);
   UserModel userModelCubit=UserModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =FirebaseFirestore.instance;
 UserApi userApi=UserApi();


  signInAuth(String email,String password) {
    emit(SignInLoading());
     auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      if (value != null) {
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);

        emit(SignInSuccess());
      } else {
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        emit(SignInFailed(onError.toString()));
        print(onError.toString());
      }
    }).catchError((onError){
       print(onError.toString());
       showToast(msg: onError.toString(), state: ToastedStates.WARNING);
       emit(SignInFailed(onError.toString()));
       print(onError.toString());


       });


     }


  forgetPass(email)async{
    emit(CodePassLoading());
    await auth.sendPasswordResetEmail(email: email).then((value)  {

        emit(CodePassSuccess());
        showToast(msg: 'Check your Gmail', state: ToastedStates.SUCCESS);


    }).catchError((onError){

      emit(CodePassFailed());
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);


    });


  }

   signUpAuth(UserModel userModel,context)async {

    emit(SignUpLoading());
    await auth.createUserWithEmailAndPassword(email: userModel.email!, password: userModel.password!).then((user) {
      user.user!.sendEmailVerification();

      //if(user.user!.emailVerified){
        if(user != null)
        {
          userApi.addUser(userModel,context).then((val){
            showToast(msg: 'Done', state: ToastedStates.SUCCESS);
            emit(SignUpSuccess());
            auth.currentUser!.reload();

          }).catchError((onError){
            showToast(msg: onError.toString(), state: ToastedStates.ERROR);
            print(onError.toString());

          });

        }else{
          showToast(msg: onError.toString(), state: ToastedStates.ERROR);
          emit(SignUpFailed());
          print(onError.toString());


        }



    }).catchError((onError){
      showToast(msg: onError.toString(), state: ToastedStates.WARNING);

    });

  }


   checkUserExist({uid,}){
  UserModel userModelCubit=UserModel();

  FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .get()
      .then((value) {
    if (value.exists) {
      print('Account exist Go to ShopLayout');
      userModelCubit = UserModel.fromJson(value.data()!);
      emit(SignInSuccess());
    } else {
      emit(SignInNeedRegister());
      print('Account Not exist Go to Register');
    }
  }).catchError((onError) {
    emit(SignInFailed(onError.toString()));
    print('ErroNO: ${onError.toString()}');
  });
}

  signOut()async{
   await auth.signOut().then((value) => {
      emit(SignOut()),
//     CacheHelper.putString('Name',''),
//     CacheHelper.putString('Email',''),
   showToast(msg: 'Done', state: ToastedStates.SUCCESS),

   }).catchError((onError){
     showToast(msg: onError.toString(), state: ToastedStates.ERROR);


   });
  }

  changeEmailAndPass({currentEmail,newEmail,currentPassword,newPassword})async {
    emit(ChangeAuthLoading());
    var uid = auth.currentUser!.uid;
    print(auth.currentUser!.uid);
    var cridential;
  try {
     cridential = EmailAuthProvider.credential(
        email: currentEmail, password:currentPassword);
  }catch(error){

    showToast(msg: error.toString(), state: ToastedStates.ERROR);
    emit(ChangeAuthFailed());
  }
  await auth.currentUser!.reauthenticateWithCredential(cridential).then((value) => {
    auth.currentUser!.updatePassword(newPassword),
  auth.currentUser!.updateEmail(newEmail).then((value) => {
  firestore.collection('users').doc(uid).update({
  'userEmail': newEmail,
  }),
    showToast(msg: 'Done', state: ToastedStates.SUCCESS),
    emit(ChangeAuthSuccess()),

  }).catchError((onError){
  showToast(msg: onError.toString(), state: ToastedStates.ERROR);

  emit(ChangeAuthFailed());

  }),
    auth.currentUser!.reload(),


    }).catchError((onError){
      showToast(msg: onError.toString(), state: ToastedStates.ERROR);

      emit(ChangeAuthFailed());
    });
  }



  changePassword(password) async {
    auth.currentUser!.updatePassword(password).then((_) {
      print("Successfully changed password");
    }).catchError((error) {
      print("Password can't be changed" + error.toString());
    });
  }


//  Future<UserCredential> signInWithGoogle() async {
//    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//    final credential = GoogleAuthProvider.credential(
//      accessToken: googleAuth?.accessToken,
//      idToken: googleAuth?.idToken,
//    );
//
//    var userUid= await FirebaseAuth.instance.signInWithCredential(credential);
//    SharedPreferences pref=await SharedPreferences.getInstance();
//    pref.setString('userUid', userUid.user!.uid);
//    pref.setString('userEmail', userUid.user!.email.toString());
//    pref.setString('userName', userUid.user!.displayName.toString());
//    await firestore.collection('users').doc(userUid.user!.uid).set({
//      'email':userUid.user!.email,
//      'name':userUid.user!.displayName,
//      'location':city!,
//      'id':userUid.user!.uid,
//      'isAdmin':'false'
//
//    });
//    print(userUid.user!.displayName.toString());
//    print(userUid.user!.uid);
//    print(userUid.user!.email);
//    return userUid;
//
//  }

}
