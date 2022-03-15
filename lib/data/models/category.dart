
import 'package:flutter/material.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';

class CategoryModel{
  String? img;
  String? text;
  Color? color;

  CategoryModel({this.img, this.text, this.color});

}
List<CategoryModel> categoryList=[
  CategoryModel(img:sandwitch ,text: 'sandwiches',color: priGreen),
  CategoryModel(img: seafood,text: 'seafood',color: Color(0xFFDBB558)),
  CategoryModel(img:drink ,text: 'drinks',color: Color(0xFFBB355D)),
  CategoryModel(img:desserts ,text: 'desserts',color: Color(0xFF15656D)),
  CategoryModel(img: salade,text: 'salad',color: Color(0xFFB8B85E)),
  CategoryModel(img:keto ,text: 'drinks',color:Colors.green),
  CategoryModel(img:slides ,text: 'ketogenic',color: Color(0xFFDD9746)),
  CategoryModel(img: chicken,text: 'chicken',color: Color(0xFF685C1E)),
  CategoryModel(img:beef ,text: 'beef',color: Color(0xFFB7511A)),

];