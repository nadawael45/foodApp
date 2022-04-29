
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';

class CategoryModel{
  String? img;
  String? text;
  Color? color;

  CategoryModel({this.img, this.text, this.color});

}
List<CategoryModel> categoryList=[
  CategoryModel(img:sandwitch ,text: 'sandwiches'.tr(),color: priGreen),
  CategoryModel(img: seafood,text: 'seafood'.tr(),color: Color(0xFFDBB558)),
  CategoryModel(img:drink ,text: 'drinks'.tr(),color: Color(0xFFBB355D)),
  CategoryModel(img:desserts ,text: 'desserts'.tr(),color: Color(0xFF15656D)),
  CategoryModel(img: salade,text: 'salad'.tr(),color: Color(0xFFB8B85E)),
  CategoryModel(img:keto ,text: 'drinks'.tr(),color:Colors.green),
  CategoryModel(img:slides ,text: 'ketogenic'.tr(),color: Color(0xFFDD9746)),
  CategoryModel(img: chicken,text: 'chicken'.tr(),color: Color(0xFF685C1E)),
  CategoryModel(img:beef ,text: 'beef'.tr(),color: Color(0xFFB7511A)),

];