import 'package:fitandfresh/data/models/cart.dart';

abstract class QuantityStates{}
class  LoadingState extends QuantityStates{}

class  DecreaseState extends QuantityStates{
  List<CartModel>cart;
 // var quantity;

  DecreaseState(this.cart);

}
class  IncreaseState extends QuantityStates{
  //var quantity;
  List<CartModel>cart;

  IncreaseState(this.cart);
}