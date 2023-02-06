import 'package:equatable/equatable.dart';

class UpdateCart extends Equatable
{
  final int quantity;

  const UpdateCart({required this.quantity});

  @override
  List<Object?> get props =>
      [
        quantity,
      ];


}