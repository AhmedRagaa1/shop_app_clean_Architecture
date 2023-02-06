import 'package:shop_app/features/Setting/domain/entites/add_complaint.dart';

class AddComplaintModel extends AddComplaint {
  const AddComplaintModel({required super.id, required super.message});

  factory AddComplaintModel.fromJson(Map<String, dynamic> json) =>
      AddComplaintModel(
        id: json['id'],
        message: json['message'],
      );
}
