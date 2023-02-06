import 'package:equatable/equatable.dart';

class LogOut extends Equatable {
  final int id;
  final String token;

  const LogOut({
    required this.id,
    required this.token,
  });

  @override
  List<Object?> get props =>
      [
        id,
        token,
      ];
}
