import 'package:equatable/equatable.dart';

class ProfileData extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  const ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  @override
  List<Object?> get props =>
      [
        id,
        name,
        email,
        email,
        phone,
        image,
        token,
      ];
}
