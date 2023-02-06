
import 'package:shop_app/features/home_data/domain/entites/add_favorite.dart';

class AddFavoriteModel extends AddFavorite {
  const AddFavoriteModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory AddFavoriteModel.fromJson(Map<String, dynamic> json) => AddFavoriteModel(
    id: json['id'],
    price: json['price'].toDouble(),
    oldPrice: json['old_price'].toDouble(),
    discount: json['discount'].toDouble(),
    image: json['image'],
  );
}
