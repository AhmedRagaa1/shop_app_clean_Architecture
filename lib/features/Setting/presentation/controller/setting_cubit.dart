import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/Setting/domain/entites/notifications.dart';
import 'package:shop_app/features/Setting/domain/entites/profile.dart';
import 'package:shop_app/features/Setting/domain/usescase/add_complaint_use_case.dart';
import 'package:shop_app/features/Setting/domain/usescase/profile_use_case.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../domain/entites/add_complaint.dart';
import '../../domain/entites/cansel_order.dart';
import '../../domain/entites/ger_order.dart';
import '../../domain/entites/logout.dart';
import '../../domain/usescase/cansel_order_use_case.dart';
import '../../domain/usescase/get_order_use_case.dart';
import '../../domain/usescase/log_out_use_case.dart';
import '../../domain/usescase/notification_use_case.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(
    this.profileUseCase,
    this.notificationUseCase,
    this.getOrderUseCase,
    this.logoutUseCase,
    this.canselOrderUseCase,
    this.addComplaintUseCase,
  ) : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);

  ProfileUseCase profileUseCase;
  ProfileData getProfile = const ProfileData(
      id: 1, name: '', email: '', phone: '', image: '', token: '');

  FutureOr<void> getProfileData() async {
    emit(GetProfileLoadingState());
    final result = await profileUseCase(const NoParameters());

    result.fold((l) {
      print(l.message);
      emit(GetProfileErrorState(l.message));
    }, (r) {
      print('profile cubit 11111111112341253551155');
      print(r);
      print(r.name);
      getProfile = r;
      print('9669696969696669');
      print(getProfile.name);
      emit(GetProfileSuccessState(r));
    });
  }

  NotificationUseCase notificationUseCase;
  List<Notifications> notifications = [];

  FutureOr<void> getNotificationData({
    required String token,
  }) async {
    emit(GetNotificationsLoadingState());
    final result = await notificationUseCase(NotificationDataParameters(token));

    result.fold((l) {
      print('eroooororororororo');
      emit(GetNotificationsErrorState(l.message));
    }, (r) {
      print(r[1].message);
      notifications = r;
      print(notifications[4].message);
      emit(GetNotificationsSuccessState(r));
    });
  }

  GetOrderUseCase getOrderUseCase;
  List<GetOrder> orders = [];

  FutureOr<void> getOrders() async {
    emit(GetOrderLoadingState());
    final result = await getOrderUseCase(const NoParameters());

    result.fold((l) {
      emit(GetOrderErrorState(l.message));
    }, (r) {
      print('Get order Cubit i came');
      orders = r;
      emit(GetOrderSuccessState(r));
    });
  }

  LogoutUseCase logoutUseCase;

  FutureOr<void> logOut() async {
    emit(LogOutLoadingState());
    final result = await logoutUseCase(const NoParameters());

    result.fold((l) {
      emit(LogOutErrorState(l.message));
    }, (r) {
      print('LogOut Cubit i came');
      print(r.token);
      emit(LogOutSuccessState(r));
    });
  }

  CanselOrderUseCase canselOrderUseCase;

  FutureOr<void> canselOrder({
    required int orderId,
  }) async {
    emit(CanselOrderLoadingState());
    final result =
        await canselOrderUseCase(CanselOrderParameters(orderId: orderId));

    result.fold((l) {
      emit(CanselOrderErrorState(l.message));
    }, (r) {
      print('Cansel Order Cubit i came');
      print(r.cost);
      getOrders();
      emit(CanselOrderSuccessState(r));
    });
  }

  AddComplaintUseCase addComplaintUseCase;

  FutureOr<void> addComplaint({
    required String message,
  }) async {
    emit(AddComplaintLoadingState());
    final result =
        await addComplaintUseCase(AddComplaintParameters(message: message));

    result.fold((l) {
      emit(AddComplaintErrorState(l.message));
    }, (r) {
      print('Add Complaint Cubit i came');
      print(r.message);
      emit(AddComplaintSuccessState(r));
    });
  }
}
