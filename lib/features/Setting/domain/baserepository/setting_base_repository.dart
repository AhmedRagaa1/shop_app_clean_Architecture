import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/entites/cansel_order.dart';
import 'package:shop_app/features/Setting/domain/entites/profile.dart';
import 'package:shop_app/features/Setting/domain/usescase/profile_use_case.dart';

import '../entites/add_complaint.dart';
import '../entites/ger_order.dart';
import '../entites/logout.dart';
import '../entites/notifications.dart';
import '../usescase/add_complaint_use_case.dart';
import '../usescase/cansel_order_use_case.dart';
import '../usescase/notification_use_case.dart';

abstract class SettingBaseRepository
{
  Future<Either<Failure, ProfileData>> getProfileData();
  Future<Either<Failure, List<Notifications>>> getNotificationData(NotificationDataParameters parameters);
  Future<Either<Failure , List<GetOrder>>> getOrder();
  Future<Either<Failure , LogOut>> logOut();
  Future<Either<Failure , CanselOrder>> canselOrder(CanselOrderParameters parameters);
  Future<Either<Failure , AddComplaint>> addComplaint(AddComplaintParameters parameters);

}