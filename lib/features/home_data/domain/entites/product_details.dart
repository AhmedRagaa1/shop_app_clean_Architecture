import 'package:equatable/equatable.dart';

class ProductDetails extends Equatable {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;
  final List<String> images;

  const ProductDetails({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        oldPrice,
        discount,
        name,
        description,
        inFavorites,
        inCart,
        images,
      ];
}
