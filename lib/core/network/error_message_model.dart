import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable
{
  final bool status;
  final String message;

  const ErrorMessageModel({
    required this.status,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String , dynamic> json)
  {
    return ErrorMessageModel(
      status: json["status"],
      message: json["message"],
    );

  }

  @override
  List<Object?> get props => [
    status ,
    message ,
  ];
}