class CartModel {
  String? orderName, date, img, price, id;
  var productId;
  int? total, quantity;
  bool? isFavourite;
 // List? cartListModel=[];

  CartModel(
      { this.orderName, this.date,  this.price, this.quantity,this.productId,
        this.total,  this.img, this.id,this.isFavourite

      });

  toJson(id) {
    return {
      'ItemName': orderName,
      'Quantity': quantity,
      'Price': price,
      'ItemImage': img,
      'Id': id,
      'ProductId':productId,
    };
  }

  CartModel.fromJson(Map<String, dynamic>json){
      orderName=json['ItemName'];
      price=json['Price'];
      img=json['ItemImage'];
     // quantity=1;
      quantity=json['Quantity'];
      productId=json['ProductId'];
     id=json['Id'];

  }



//  CartModel.fromFavJson(Map<String,dynamic>json){
//    img=json['productImage'];
//    orderName=json['productName'];
//    price=json['productPrice'];
//    id=json['id'];
//
//
//
//  }
}