import 'package:shop_app/features/authentication/domain/entites/auth.dart';

import 'data_model.dart';

class AuthModel extends Authentication {
  const AuthModel({
    required super.status,
    required super.message,
     super.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };

}
