import 'package:shop_app/features/cart/domain/entites/update_cart.dart';

class UpdateCartModel extends UpdateCart {
  const UpdateCartModel({required super.quantity});

  factory UpdateCartModel.fromJson(Map<String, dynamic> json)=>
      UpdateCartModel(quantity: json['quantity'],);

}