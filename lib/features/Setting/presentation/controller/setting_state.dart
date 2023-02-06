part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}

class GetProfileLoadingState extends SettingState {}
class GetProfileSuccessState extends SettingState
{
  final ProfileData profileData;

  GetProfileSuccessState(this.profileData);
}
class GetProfileErrorState extends SettingState{
  final String error;
  GetProfileErrorState(this.error);
}


class GetNotificationsLoadingState extends SettingState {}
class GetNotificationsSuccessState extends SettingState
{
  final List<Notifications> notifications;

  GetNotificationsSuccessState(this.notifications);
}
class GetNotificationsErrorState extends SettingState{
  final String error;
  GetNotificationsErrorState(this.error);
}

class GetOrderLoadingState extends SettingState{}
class GetOrderSuccessState extends SettingState
{
  final List<GetOrder> addOrder;

  GetOrderSuccessState(this.addOrder);
}
class GetOrderErrorState extends SettingState
{
  final String error;

  GetOrderErrorState(this.error);
}

class LogOutLoadingState extends SettingState{}
class LogOutSuccessState extends SettingState
{
  final LogOut logOut;

  LogOutSuccessState(this.logOut);
}
class LogOutErrorState extends SettingState
{
  final String error;

  LogOutErrorState(this.error);
}


class CanselOrderLoadingState extends SettingState{}
class CanselOrderSuccessState extends SettingState
{
  final CanselOrder canselOrder;

  CanselOrderSuccessState(this.canselOrder);
}
class CanselOrderErrorState extends SettingState
{
  final String error;

  CanselOrderErrorState(this.error);
}


class AddComplaintLoadingState extends SettingState{}
class AddComplaintSuccessState extends SettingState
{
  final AddComplaint addComplaint;

  AddComplaintSuccessState(this.addComplaint);
}
class AddComplaintErrorState extends SettingState
{
  final String error;

  AddComplaintErrorState(this.error);
}


