import 'package:dartz/dartz.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/cart/domain/baserepository/cart_base_repository.dart';
import 'package:shop_app/features/Setting/domain/entites/ger_order.dart';

class GetOrderUseCase extends BaseUseCase<List<GetOrder> , NoParameters>
{
  final SettingBaseRepository settingBaseRepository;

  GetOrderUseCase(this.settingBaseRepository);
  @override
  Future<Either<Failure, List<GetOrder>>> call(NoParameters parameters) async
  {
    return await settingBaseRepository.getOrder();
  }

}