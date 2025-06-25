import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lune/domain/entities/entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.photo,
    required super.notificationsAreEnabled,
    required super.updatedAt,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final updatedAt = json['updatedAt'] as Timestamp;
    final createdAt = json['createdAt'] as Timestamp;
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      notificationsAreEnabled:
          json['notificationsAreEnabled'] as bool? ?? false,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(
        updatedAt.millisecondsSinceEpoch,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        createdAt.millisecondsSinceEpoch,
      ),
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      photo: entity.photo,
      notificationsAreEnabled: entity.notificationsAreEnabled,
      updatedAt: entity.updatedAt,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'photo': photo,
      'notificationsAreEnabled': notificationsAreEnabled,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
