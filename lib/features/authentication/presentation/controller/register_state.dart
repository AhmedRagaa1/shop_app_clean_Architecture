part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ShopRegisterLoadingState extends RegisterState {}

class ShopRegisterSuccessState extends RegisterState
{
  final Authentication authentication;

  ShopRegisterSuccessState(this.authentication);
}

class ShopRegisterErrorState extends RegisterState {
  final String error;

  ShopRegisterErrorState(this.error);
}

class ShopChangePasswordState extends RegisterState {}
