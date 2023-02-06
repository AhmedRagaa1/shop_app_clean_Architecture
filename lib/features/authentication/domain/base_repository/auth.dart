import 'package:dartz/dartz.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';

import '../../../../core/error/failure.dart';
import '../usecase/sign_in.dart';
import '../usecase/sign_up.dart';

abstract class AuthBaseRepository
{
  Future<Either<Failure, Authentication>> signIn(SignInParameters parameters);
  Future<Either<Failure, Authentication>> signUp(SignUpParameters parameters);
}