import '../../../data/models/product.dart';

class FavStates{

}

class InitialFav extends FavStates{}
//class AddedFavSuccess extends FavStates{}
//class AddedFavFailed extends FavStates{}

class LoadingFav extends FavStates{}
class GetFavSuccess extends FavStates{
  final List<OrderModel>favList;

  GetFavSuccess(this.favList);

}
class GetFavFailed extends FavStates{}

//class DeleteSuccess extends FavStates{}

