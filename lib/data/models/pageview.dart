import 'package:fitandfresh/constants/images.dart';
import 'package:easy_localization/easy_localization.dart';

class PageModel{
  String? img;
  String? text1;
  String? text2;

  PageModel({this.img, this.text1, this.text2});

}
List<PageModel> boardList=[
  PageModel(img:img4 ,text1: "Welcome in our App",text2: ('All you need in one place')),
  PageModel(img:img2 ,text1: 'Best Experience',text2: 'Let\'s Make A Delicious Healthy Food With The Best Recipe For The Familiy'),
  PageModel(img:img3 ,text1: 'Free Shopping',text2: 'Free Shopping'),

];