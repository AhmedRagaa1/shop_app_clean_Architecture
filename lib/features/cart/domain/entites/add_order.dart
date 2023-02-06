import 'package:equatable/equatable.dart';

class AddOrder extends Equatable {
  final String paymentMethod;
  final double cost;
  final double vat;
  final double discount;
  final double points;
  final double total;
  final int id;

  const AddOrder({
    required this.paymentMethod,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.points,
    required this.total,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [
        paymentMethod,
        cost,
        vat,
        discount,
        points,
        total,
        id,
      ];
}
