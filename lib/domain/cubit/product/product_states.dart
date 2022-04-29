import 'package:fitandfresh/data/models/product.dart';

abstract class ProductStates{

}
class GetProductSuccess extends ProductStates{
  final List<OrderModel>proList;

  GetProductSuccess(this.proList);

}
class ProductLoading extends ProductStates{}
class GetProductFailed extends ProductStates{

  var error;

  GetProductFailed(this.error);

}