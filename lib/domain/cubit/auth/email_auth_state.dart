class EmailAuthStates{
}
class InitialState extends EmailAuthStates{}

class SignInLoading extends EmailAuthStates{}
// في حاله النجاح لازم اعرف رقم التليفون لان معني ان هو نجح ان االرساله اتبعتت بتاعه الرقم السري
class SignInSuccess extends EmailAuthStates{
}
class SignInFailed extends EmailAuthStates{
  String? error;

  SignInFailed(this.error);



}
class SignInNeedRegister extends EmailAuthStates{}



class CodePassLoading extends EmailAuthStates{}
class CodePassSuccess extends EmailAuthStates{}
class CodePassFailed extends EmailAuthStates{}

class SignUpLoading extends EmailAuthStates{}
class SignUpSuccess extends EmailAuthStates{}
class SignUpFailed extends EmailAuthStates{}

class SignOut extends EmailAuthStates{}

class ChangeAuthLoading extends EmailAuthStates{}
class ChangeAuthSuccess extends EmailAuthStates{}
class ChangeAuthFailed extends EmailAuthStates{}



