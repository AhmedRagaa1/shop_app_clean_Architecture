import 'package:shop_app/features/Setting/domain/entites/ger_order.dart';

class GetOrderModel extends GetOrder {
  const GetOrderModel({
    required super.id,
    required super.total,
    required super.date,
    required super.status,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        id: json['id'],
        total: json['total'].toDouble(),
        date: json['date'],
        status: json['status'],
      );
}
