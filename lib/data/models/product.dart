import '../../shared/constants/images.dart';

class OrderModel{
  String? img;
  String? itemName;
  String? itemPrice;
  int? quantity;
  String? date;
  String? desc;
  String? calory, fat, carb, protein;
  var id;
  bool isFavourite=false;
  var favId;


  OrderModel({ this.img, this.itemName, this.itemPrice, this.quantity,this.date,this.desc,this.isFavourite=false,
  this.calory, this.fat, this.carb, this.protein, this.id,this.favId});

  OrderModel.fromJson(Map<String,dynamic>json){

    itemName = json['productName'];
    itemPrice = json['productPrice'];
    id = json['productId'];
    img = json['productImage'];
    desc = json['productDesc'];
    carb = json['productCarb'];
    calory = json['productCalory'];
    fat = json['productFats'];
    protein = json['productProtein'];

  }

  OrderModel.fromfavJson(Map<String,dynamic>json){
    img=json['productImage'];
   itemName=json['productName'];
   itemPrice=json['productPrice'];
  id=json['id'];
 // isFavourite=true;




  }

   copyWith({ String? name, String? price, String? fat, String? category, String? cal,
     String? id,String? carb,String?img,String?protein ,String?desc})
  {
    return OrderModel(
      itemName: name ?? this.itemName,
      itemPrice: price ?? this.itemPrice,
      fat: fat ?? this.fat,
      calory: cal ?? this.calory,
      id: id ?? this.id,
      carb: carb?? this.carb,
      desc: date?? this.desc,
      img: img??this.img,
      protein: protein??this.protein


    ); }


  copyFavWith({ String? name, String? price,
    String? id,String?img,String? favId})
  {
    return OrderModel(
        itemName: name ?? this.itemName,
        itemPrice: price ?? this.itemPrice,
        id: id ?? this.id,
        img: img??this.img,
         favId: favId??this.favId


    ); }
}




