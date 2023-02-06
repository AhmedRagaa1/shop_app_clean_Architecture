import 'package:flutter/material.dart';
import 'package:shop_app/features/Setting/domain/entites/notifications.dart';

class NotificationModel extends Notifications {
  const NotificationModel({required super.title, required super.message});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'],
        message: json['message'],
      );
}
