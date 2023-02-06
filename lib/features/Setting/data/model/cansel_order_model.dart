import 'package:shop_app/features/Setting/domain/entites/cansel_order.dart';

class CanselOrderModel extends CanselOrder {
  const CanselOrderModel({
    required super.id,
    required super.cost,
    required super.paymentMethod,
  });

  factory CanselOrderModel.fromJson(Map<String, dynamic> json) =>
      CanselOrderModel(
        id: json['id'],
        cost: json['cost'].toDouble(),
        paymentMethod: json['payment_method'],
      );
}
