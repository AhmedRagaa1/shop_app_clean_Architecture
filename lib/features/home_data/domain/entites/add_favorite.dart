import 'package:equatable/equatable.dart';

class AddFavorite extends Equatable {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;

  const AddFavorite({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        oldPrice,
        discount,
        image,
      ];
}