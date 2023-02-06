import 'package:equatable/equatable.dart';

class GetOrder extends Equatable {
  final int id;
  final double total;
  final String date;
  final String status;

  const GetOrder({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props =>
      [
        id,
        total,
        date,
       status,
      ];
}
