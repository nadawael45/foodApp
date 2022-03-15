
import '../../shared/constants/images.dart';

class Meal {
    String? img;
    String? itemName;
    String? itemPrice;



  Meal({  required this.img,required this.itemName,required  this.itemPrice}
     );
}

List<Meal> itemsList = [
Meal(img: mix1, itemName: 'mix grill', itemPrice: '115'),
Meal(img: mix2, itemName: 'mix seafood', itemPrice: '115')];

