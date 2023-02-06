part of 'login_cubit.dart';

@immutable

abstract class LoginState {}

class LoginInitial extends LoginState{}


class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState
{
  final Authentication authentication;

  LoginSuccessState(this.authentication);
}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordState extends LoginState{}





