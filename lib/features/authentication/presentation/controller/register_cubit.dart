import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_up.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/shared _pref.dart';
part 'register_state.dart';




class RegisterCubit extends Cubit<RegisterState>
{
  RegisterCubit(this.signUpUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);


  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;

    suffix = isPassword ?   Icons.visibility : Icons.visibility_off;

    emit(ShopChangePasswordState());
  }

  SignUpUseCase signUpUseCase;
  dynamic registerCubit;
  FutureOr<void> signUp(
      {
        required String name,
        required String email,
        required String password,
        required String phone,
      }) async
  {
    emit(ShopRegisterLoadingState());
    final result = await signUpUseCase(SignUpParameters(
        {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }));

    result.fold((l) {
      emit(ShopRegisterErrorState(l.message));
    },
            (r) {
          print('mohamed Thanks god');
          registerCubit = r;
          print(registerCubit);
          PreferenceUtils.setString(SharedKeys.token, r.data!.token);
          token = r.data!.token;
          emit(ShopRegisterSuccessState(r));
        }
    );
  }

}




