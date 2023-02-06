import 'package:shop_app/features/favorite/data/model/product_item_favorite_model.dart';
import 'package:shop_app/features/favorite/domain/entites/favorite.dart';

class GetFavoriteModel extends Favorite
{
  const GetFavoriteModel({
    required super.id,
    required super.productItemFavorite,

  });

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) =>
      GetFavoriteModel(
        id: json['id'],
        productItemFavorite: json['product'] != null ? ProductItemFavoriteModel.fromJson(json['product']) : null,

      );
}
