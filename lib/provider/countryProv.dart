import 'package:flutter/material.dart';

class CountryProv extends ChangeNotifier{
  String? countryName;
  getCountry(contName){
    countryName=contName;
    notifyListeners();


  }
}