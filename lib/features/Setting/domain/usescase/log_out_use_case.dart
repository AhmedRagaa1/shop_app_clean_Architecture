import 'package:dartz/dartz.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/Setting/domain/entites/logout.dart';

class LogoutUseCase extends BaseUseCase<LogOut , NoParameters>
{
  final SettingBaseRepository settingBaseRepository;

  LogoutUseCase(this.settingBaseRepository);
  @override
  Future<Either<Failure, LogOut>> call(NoParameters parameters) async
  {
    return await settingBaseRepository.logOut();
  }

}