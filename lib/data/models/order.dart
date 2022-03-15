import '../../shared/constants/images.dart';

class OrderModel{
  String? img;
  String? itemName;
  String? itemPrice;
  String? quantity;
  String? date;
  String? desc;
  String? calory, fat, carb, protein;
  var id;


  OrderModel({ this.img, this.itemName, this.itemPrice, this.quantity,this.date,this.desc,
  this.calory, this.fat, this.carb, this.protein, this.id});

  fromJson(doc){

    itemName = doc.get('productName');
    itemPrice = doc.get('productPrice');
    id = doc.get('productId');
    img = doc.get('productImage');
    desc = doc.get('productDesc');
    carb = doc.get('productCarb');
    calory = doc.get('productCalory');
    fat = doc.get('productFats');
    protein = doc.get('productProtein');

  }
}






String descr=
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur';
List<OrderModel>orderList=[
  OrderModel(img: mix1, itemName: 'mix grill', itemPrice: '115 EGP',desc:
  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, '
      'sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'

  ),
  OrderModel(img: mix2, itemName: 'mix seafood', itemPrice:'115 EGP',desc: descr),
  OrderModel(img: mix2, itemName: 'mix seafood', itemPrice:'115 EGP',desc: descr),
  OrderModel(img: mix2, itemName: 'mix seafood', itemPrice:'115 EGP',desc: descr),



];


