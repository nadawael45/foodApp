import 'package:bloc/bloc.dart';
import 'package:fitandfresh/domain/cubit/cart/cart_cubit.dart';
import 'package:fitandfresh/domain/cubit/quantity/quantity_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<QuantityStates>{
  QuantityCubit() : super(LoadingState());

  static QuantityCubit get(context) => BlocProvider.of(context);


  increase(cartListIndex,cartlist,context){


    cartListIndex.quantity++;
    emit(IncreaseState(cartlist));
    print('incccccccccccccccccccccc');
    print(cartListIndex.quantity);



   CartCubit.get(context).gettotal(cartlist);

  }

  decrease(cartListIndex,cartList,context){
    if(cartListIndex.quantity<=1){
      cartListIndex.quantity=1;
    }else{
      cartListIndex.quantity--;

    }
    emit(DecreaseState(cartList));

    print(cartListIndex.quantity);
    CartCubit.get(context).gettotal(cartList);


  }
}




