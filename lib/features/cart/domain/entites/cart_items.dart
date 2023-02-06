import 'package:equatable/equatable.dart';
import 'package:shop_app/features/cart/domain/entites/product.dart';

class CartItem extends Equatable {
  final int id;
  final int quantity;
  final ProductItem? productItem;

  const CartItem({
    required this.id,
    required this.quantity,
    required this.productItem,

  });

  @override
  List<Object?> get props =>
      [
        id,
        productItem,
        quantity,
      ];
}