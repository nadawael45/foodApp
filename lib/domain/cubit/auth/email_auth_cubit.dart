import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/domain/cubit/auth/phone_auth_state.dart';
import 'package:fitandfresh/presentation/dialoges/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthStates> {
  EmailAuthCubit() : super(InitialState());
  static EmailAuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  SignInAuth(String email,String password) {
    emit(SignInLoading());
     auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      if (value != null) {
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);

        emit(SignInSuccess(email));
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
    await auth.sendPasswordResetEmail(email: email);
  }
  SignUpAuth(String email,String password) {
    emit(SignUpLoading());
    auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      if(value != null)
      {
        showToast(msg: 'Done', state: ToastedStates.SUCCESS);

        emit(SignUpSuccess());
      }else{
        showToast(msg: onError.toString(), state: ToastedStates.ERROR);
        emit(SignUpFailed());
        print(onError.toString());


      }

    });

  }

  //هعمل ميثود تانيه استقبل فيها ال  pin code
}
