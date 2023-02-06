import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final double price;
  final String image;
  final String name;
  final bool inFavorites;
  final bool inCart;

  const Search({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        image,
        name,
        inFavorites,
        inCart,
      ];
}
