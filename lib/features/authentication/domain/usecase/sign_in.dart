import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/authentication/domain/base_repository/auth.dart';
import 'package:shop_app/features/authentication/domain/entites/auth.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';

class SignInUseCase extends BaseUseCase<Authentication, SignInParameters>
{
 final AuthBaseRepository authBaseRepository;
  SignInUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, Authentication>> call(SignInParameters parameters) async
  {
   return await authBaseRepository.signIn(parameters);
  }


}


class SignInParameters extends Equatable
{
 final Map<String , dynamic> data;

  const SignInParameters(this.data);

  @override
  List<Object?> get props => [data];
}