import 'package:equatable/equatable.dart';

class AddComplaint extends Equatable
{
  final int id;
  final String message;

  const AddComplaint({
    required this.id,
    required this.message,
  });

  @override
  List<Object?> get props =>
      [
        id,
        message,
      ];
}
