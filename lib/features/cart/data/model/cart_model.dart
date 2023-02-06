import 'package:shop_app/features/cart/data/model/cart_items.dart';

import '../../domain/entites/cart.dart';

class GetCartModel extends Cart {
  const GetCartModel({
    required super.subTotal,
    required super.total,
    required super.cartItems,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        subTotal: json['sub_total'].toInt(),
        total: json['total'].toInt(),
        cartItems: List<CartItemModel>.from(
            json['cart_items'].map((x) => CartItemModel.fromJson(x))),
      );
}
