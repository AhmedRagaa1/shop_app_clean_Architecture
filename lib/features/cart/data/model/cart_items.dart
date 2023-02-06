import 'package:shop_app/features/cart/data/model/product_Item_model.dart';

import '../../domain/entites/cart.dart';
import '../../domain/entites/cart_items.dart';

class CartItemModel extends CartItem{
  const CartItemModel({
    required super.id,
    required super.quantity,
    required super.productItem,

  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      CartItemModel(
        id: json['id'],
        quantity: json['quantity'],
        productItem: json['product'] != null ? ProductItemModel.fromJson(json['product']) : null

      );
}
