import '../../domain/entites/product_details.dart';

class ProductDetailsModel extends ProductDetails {
  const ProductDetailsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.name,
    required super.description,
    required super.inFavorites,
    required super.inCart,
    required super.images,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        name: json['name'],
        description: json['description'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart'],
        images: List<String>.from(json['images'].map((e) => e)),
      );
}
