import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/base_use_case/base_use_case.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/Setting/domain/baserepository/setting_base_repository.dart';
import 'package:shop_app/features/Setting/domain/entites/add_complaint.dart';

class AddComplaintUseCase extends BaseUseCase<AddComplaint ,AddComplaintParameters >
{
  final SettingBaseRepository settingBaseRepository;

  AddComplaintUseCase(this.settingBaseRepository);

  @override
  Future<Either<Failure, AddComplaint>> call(AddComplaintParameters parameters)async
  {
    return await settingBaseRepository.addComplaint(parameters);
  }


}


class AddComplaintParameters extends Equatable {

  final String message;

  const AddComplaintParameters({ required this.message,});

  @override
  List<Object?> get props =>
      [

        message,
      ];
}