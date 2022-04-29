import 'dart:async';

import 'package:fitandfresh/data/api/product_api.dart';
import 'package:fitandfresh/domain/cubit/product/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api/fav_api.dart';
import '../../../data/api/product_api.dart';
import '../../../data/models/product.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductLoading());

  static ProductCubit get(context) => BlocProvider.of(context);
late final StreamSubscription<List<OrderModel>>subscription;
  getMyProduct() {
  //  ProductApi productApi =ProductApi();
    emit((ProductLoading()));
   subscription=
    ProductApi().getProducts().listen((event) {
     // ProductApi().productList.clear();

    // event.clear();
      emit(GetProductSuccess(event));
    })..onError((e){
      emit(GetProductFailed(e));

    });
  }

  @override
  Future<void> close() async{
    await subscription.cancel();
    return super.close();
  }

}