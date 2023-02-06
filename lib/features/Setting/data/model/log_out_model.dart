import '../../domain/entites/logout.dart';

class LogOutModel extends LogOut {
  const LogOutModel({
    required super.id,
    required super.token,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) => LogOutModel(
        id: json['id'],
        token: json['token'],
      );
}
