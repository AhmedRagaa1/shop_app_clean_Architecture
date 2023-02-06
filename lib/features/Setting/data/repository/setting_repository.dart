import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/error/exception.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/data/datasource/setting_data_source.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/Setting/domain/entites/add_complaint.dart';
import 'package:shop_app/features/Setting/domain/entites/cansel_order.dart';
import 'package:shop_app/features/Setting/domain/entites/ger_order.dart';
import 'package:shop_app/features/Setting/domain/entites/logout.dart';
import 'package:shop_app/features/Setting/domain/entites/notifications.dart';
import 'package:shop_app/features/Setting/domain/entites/profile.dart';
import 'package:shop_app/features/Setting/domain/usescase/add_complaint_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/cansel_order_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/notification_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/profile_use_case.dart';

class SettingRepository extends SettingBaseRepository
{
  final SettingBaseRemoteDataSource settingBaseRemoteDataSource;

  SettingRepository(this.settingBaseRemoteDataSource);

  @override
  Future<Either<Failure, ProfileData>> getProfileData() async
  {
    final result = await settingBaseRemoteDataSource.getProfileData();

    try
    {
      print(result);
      print(result.name);
      return Right(result);
    }on ServerException catch(failure)
    {
      print('errrrrrrorrrrrrrrrrr');
      return Left(ServerFailure(failure.errorMessageModel.message));
    }


  }

  @override
  Future<Either<Failure, List<Notifications>>> getNotificationData(NotificationDataParameters parameters) async
  {
    final result = await settingBaseRemoteDataSource.getNotificationData(parameters);
    print(result);
    print(result[2].message);

    try
    {
      print('******* result Product');
      print(result);
      return Right(result);
    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, List<GetOrder>>> getOrder() async
  {
    final result = await settingBaseRemoteDataSource.getOrder();

    try
    {
      print('get order i came');
      return Right(result);
    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, LogOut>> logOut() async
  {
    final result = await settingBaseRemoteDataSource.logOut();

    try
    {
      print('logout i came');
      print(result.token);
      return Right(result);
    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CanselOrder>> canselOrder(CanselOrderParameters parameters) async
  {
    final result = await settingBaseRemoteDataSource.canselOrder(parameters);

    try
    {
      print('cansel Order i came');
      print(result.cost);
      return Right(result);
    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AddComplaint>> addComplaint(AddComplaintParameters parameters) async
  {
    final result = await settingBaseRemoteDataSource.addComplaint(parameters);

    try
    {
      print('add complaint i came');
      print(result.message);
      return Right(result);
    }on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}