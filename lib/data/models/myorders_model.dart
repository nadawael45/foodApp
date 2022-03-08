import '../../constants/images.dart';

class MyOrderModel{
  String? img;
  String? itemName;
  String? date;


  MyOrderModel({required this.img,required this.itemName,this.date});

}




List<MyOrderModel>myOrderList=[
  MyOrderModel(img: mix1, itemName: 'mix grill', date: 'Today 24/12',),
  MyOrderModel(img: mix2, itemName: 'mix seafood', date:'28/8 03:40',),
  MyOrderModel(img: mix1, itemName: 'mix grill', date: 'Today 24/12',),
  MyOrderModel(img: mix2, itemName: 'mix seafood', date:'28/8 03:40',),
];