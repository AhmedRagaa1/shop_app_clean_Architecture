import 'package:equatable/equatable.dart';
import 'package:shop_app/features/favorite/domain/entites/product_item_favorite.dart';

class Favorite extends Equatable {
  final int id;
  final ProductItemFavorite? productItemFavorite;


  const Favorite({
    required this.id,
    required this.productItemFavorite,

  });

  @override
  List<Object?> get props =>
      [
        id,
       productItemFavorite,
      ];
}
