import 'package:fitandfresh/data/models/product.dart';

class FavModel{
  OrderModel? orderModel;

  FavModel({this.orderModel});



  FavModel.fromJson(Map<String,dynamic>json){
    orderModel!.img=json['productImage'];
    orderModel!.itemName=json['productName'];
    orderModel!.itemPrice=json['productPrice'];
    orderModel!.id=json['id'];
    orderModel!.isFavourite=true;




  }
  toJson(){
    return{
      'productImage':orderModel!.img,
      'productName':orderModel!.itemName,
      'productPrice':orderModel!.itemPrice,
      'id':orderModel!.id



    };
}



}