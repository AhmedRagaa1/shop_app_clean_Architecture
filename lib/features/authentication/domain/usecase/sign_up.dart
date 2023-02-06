import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/authentication/domain/base_repository/auth.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';

class SignUpUseCase extends BaseUseCase<Authentication , SignUpParameters>
{
  final AuthBaseRepository authBaseRepository;

  SignUpUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, Authentication>> call(SignUpParameters parameters) async
  {
    return await authBaseRepository.signUp(parameters);
  }

}

class SignUpParameters extends Equatable
{
  final Map<String , dynamic> data;

  const SignUpParameters(this.data);

  @override
  List<Object?> get props =>
      [
        data,
      ];


}