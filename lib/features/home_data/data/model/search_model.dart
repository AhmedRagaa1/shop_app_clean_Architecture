import '../../domain/entites/search.dart';

class SearchModel extends Search {
  const SearchModel({
    required super.id,
    required super.price,
    required super.image,
    required super.name,
    required super.inFavorites,
    required super.inCart,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json['id'],
        price: json['price'].toDouble(),
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
      );
}
