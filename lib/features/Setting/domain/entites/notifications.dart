import 'package:equatable/equatable.dart';

class Notifications extends Equatable {
  final String title;
  final String message;

  const Notifications({required this.title, required this.message});

  @override
  List<Object?> get props => [
        title,
        message,
      ];
}
