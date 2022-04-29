import 'package:fitandfresh/data/models/cart.dart';

class CartStates{
}
class InitCart extends CartStates{}

class AddedCartSuccess extends CartStates{}
class AddedCartFailed extends CartStates{}

class DeleteItemCart extends CartStates{}


//class DecreaseQuantity extends CartStates{
// // var quantity;
//  var quantityIndex;
//
//  DecreaseQuantity(this.quantityIndex);
//
//}
//class IncreaseQuantity extends CartStates{
//  var quantityIndex;
//
//  IncreaseQuantity(this.quantityIndex);
//}



class LoadingCart extends CartStates{}
class GetCartSuccess extends CartStates{
  final List<CartModel>cartList;

  GetCartSuccess(this.cartList);
}
class GetCartFailed extends CartStates{}

class SubmitSuccess extends CartStates{}

class RemoveCartAddOrder extends CartStates{}

class LoadingMyOrders extends CartStates{}
class GetOrderSuccess extends CartStates{}
class GetOrderFailed extends CartStates{}