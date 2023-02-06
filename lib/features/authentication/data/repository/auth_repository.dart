import 'package:dartz/dartz.dart';
import 'package:shop_app/features/authentication/data/datasource/auth.dart';
import 'package:shop_app/features/authentication/domain/base_repository/auth.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/features/authentication/domain/usecase/sign_up.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/usecase/sign_in.dart';

class AuthRepository extends AuthBaseRepository
{
  final AuthBaseRemoteDataSource authBaseRemoteDataSource;

  AuthRepository(this.authBaseRemoteDataSource);
  @override
  Future<Either<Failure, Authentication>> signIn(SignInParameters parameters) async
  {
    try
    {
      final result = await authBaseRemoteDataSource.signIn(parameters);
      return Right(result);
    }on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, Authentication>> signUp(SignUpParameters parameters) async
  {

    try
    {
      final result = await authBaseRemoteDataSource.signUp(parameters);
      return Right(result);
    } on ServerException catch (failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }

  }

}