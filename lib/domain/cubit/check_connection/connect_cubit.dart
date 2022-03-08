import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connect_state.dart';

class CheckConnectionCubit extends Cubit<CheckConnectionState>{
  bool? isConnect;
  final connectivity=Connectivity();

  CheckConnectionCubit() : super(Loading());

  initialConnection(){
    connectivity.onConnectivityChanged.listen(checkConnection);
  }

  checkConnection(ConnectivityResult result)async{
    if(result==ConnectivityResult.wifi){
      isConnect=true;
      emit(Connect());

    }else if(result==ConnectivityResult.none){
      isConnect=false;
      emit(DisConnect());

    }


  }

}
