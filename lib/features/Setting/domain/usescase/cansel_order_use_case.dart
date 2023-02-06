import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/entites/cansel_order.dart';

import '../baserepository/setting_base_repository.dart';

class CanselOrderUseCase extends BaseUseCase<CanselOrder , CanselOrderParameters>
{
  final SettingBaseRepository settingBaseRepository;

  CanselOrderUseCase(this.settingBaseRepository);

  @override
  Future<Either<Failure, CanselOrder>> call(CanselOrderParameters parameters) async
  {
    return await settingBaseRepository.canselOrder(parameters);
  }

}


class CanselOrderParameters extends Equatable
{
  final int orderId;

  const CanselOrderParameters({required this.orderId});

  @override
  List<Object?> get props =>
      [
        orderId,
      ];
}