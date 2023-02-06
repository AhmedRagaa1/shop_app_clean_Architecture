import 'package:shop_app/features/favorite/domain/entites/favorite.dart';
import 'package:shop_app/features/favorite/domain/entites/product_item_favorite.dart';

class ProductItemFavoriteModel extends ProductItemFavorite
{
  const ProductItemFavoriteModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory ProductItemFavoriteModel.fromJson(Map<String, dynamic> json) =>
      ProductItemFavoriteModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        image: json['image'],
        name: json['name'] != null ? json['name'] : null,
        description: json['description'] != null ? json['description'] : null,
      );
}
