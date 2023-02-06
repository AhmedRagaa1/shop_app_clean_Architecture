import 'package:shop_app/features/cart/domain/entites/add_order.dart';

class AddOrderModel extends AddOrder {
  AddOrderModel({
    required super.paymentMethod,
    required super.cost,
    required super.vat,
    required super.discount,
    required super.points,
    required super.total,
    required super.id,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
        paymentMethod: json['payment_method'],
        cost: json['cost'].toDouble(),
        vat: json['vat'].toDouble(),
        discount: json['discount'].toDouble(),
        points: json['points'].toDouble(),
        total: json['total'].toDouble(),
        id: json['id'],
      );
}
