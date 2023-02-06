import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';

import '../entites/notifications.dart';

class NotificationUseCase extends BaseUseCase<List<Notifications> , NotificationDataParameters>
{

  final SettingBaseRepository settingBaseRepository;

  NotificationUseCase(this.settingBaseRepository);

  @override
  Future<Either<Failure, List<Notifications>>> call(NotificationDataParameters parameters) async
  {
    return await settingBaseRepository.getNotificationData(parameters);
  }

}


class NotificationDataParameters extends Equatable
{
  final String  token;

  const NotificationDataParameters(this.token);

  @override
  List<Object?> get props => [token];
}