
import 'package:shop_app/features/home_data/domain/entites/add_cart.dart';

class AddCartModel extends AddToCart {
  const AddCartModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
    id: json['id'],
    price: json['price'].toDouble(),
    oldPrice: json['old_price'].toDouble(),
    discount: json['discount'].toDouble(),
    image: json['image'],
  );
}
