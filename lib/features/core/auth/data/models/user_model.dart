import 'package:lune/features/core/auth/domain/entities/entities.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.updatedAt,
    required this.createdAt,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
    );
  }

  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photo;
  final DateTime updatedAt;
  final DateTime createdAt;

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      photo: photo,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
