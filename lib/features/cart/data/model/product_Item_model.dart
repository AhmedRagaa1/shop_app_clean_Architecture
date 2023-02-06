import '../../domain/entites/product.dart';

class ProductItemModel extends ProductItem {
  const ProductItemModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) =>
      ProductItemModel(
        id: json['id'],
        price: json['price'].toDouble(),
        oldPrice: json['old_price'].toDouble(),
        discount: json['discount'].toDouble(),
        image: json['image'],
        name: json['name'],
        description: json['description'],
      );
}
