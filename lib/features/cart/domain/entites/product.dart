import 'package:equatable/equatable.dart';

class ProductItem extends Equatable {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;
  final String description;

  const ProductItem({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
      ];
}