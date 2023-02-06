import 'package:equatable/equatable.dart';

class CanselOrder extends Equatable {
  final int id;
  final double cost;
  final String paymentMethod;

  const CanselOrder({
    required this.id,
    required this.cost,
    required this.paymentMethod,
  });

  @override
  List<Object?> get props =>
      [
        id,
        cost,
        paymentMethod,
      ];
}
