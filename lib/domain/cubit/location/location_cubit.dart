import 'package:fitandfresh/domain/cubit/location/location_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit() : super(LoadingService());

  static LocationCubit get(context) => BlocProvider.of(context);

 var  longitude;
  var latitude;
  String? street;


  checkService()async{
    emit(LoadingService());
     await Location().serviceEnabled().then((value) {
      if(!value){
        emit(DisEnabledService());
        Location().requestService();
      }

    }).catchError((onError){
      emit(FailedService());
      print(onError);
    });
    emit(EnabledService());
    await Location().hasPermission().then((value) {
       emit(PermissionLoading());
       if(value==PermissionStatus.denied){
         emit(PermissionDenied());
          Location().requestPermission();
       }
     }).catchError((onError){
       emit(PermissionFailed());
       print(onError);
     });
    emit(PermissionGranted());
    getLocation();


  }
  getLocation()async{
    emit(GetLocationLoading());
    Location().getLocation().then((value)  {
      longitude=value.longitude;
      latitude=value.latitude;
      print(value.longitude);
      print(value.latitude);


      GeoCode().reverseGeocoding(latitude: latitude, longitude: longitude).then((value)  {
        street=value.city;
        print(value.streetAddress);
        print(value.countryName);
        print(value.city);

        print('ttttttttt');
        print(street);
        emit(GetLocationSuccess());

      }).catchError((onError){
        emit(GetLocationFailed());
        print(onError);
      });


    }).catchError((onError){
    emit(GetLocationFailed());
    print(onError);
  });


}}