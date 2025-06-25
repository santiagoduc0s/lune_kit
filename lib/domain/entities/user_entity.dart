import 'package:equatable/equatable.dart';
import 'package:lune/core/utils/utils.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.notificationsAreEnabled,
    required this.updatedAt,
    required this.createdAt,
  });

  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photo;
  final bool notificationsAreEnabled;
  final DateTime updatedAt;
  final DateTime createdAt;

  String get initials {
    final f = firstName ?? '';
    final l = lastName ?? '';

    if (f.isEmpty || l.isEmpty) return '';

    return '${f[0]}${l[0]}'.toUpperCase();
  }

  String get fullName => '$firstName $lastName';

  @override
  String toString() {
    return 'UserAuth(\n'
        '  id: $id,\n'
        '  firstName: $firstName,\n'
        '  lastName: $lastName,\n'
        '  email: $email,\n'
        '  photo: $photo,\n'
        '  notificationsAreEnabled: $notificationsAreEnabled,\n'
        '  updatedAt: $updatedAt,\n'
        '  createdAt: $createdAt\n'
        ')';
  }

  UserEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    NullableParameter<String?>? photo,
    bool? notificationsAreEnabled,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      photo: photo != null ? photo.value : this.photo,
      notificationsAreEnabled:
          notificationsAreEnabled ?? this.notificationsAreEnabled,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      photo,
      notificationsAreEnabled,
      updatedAt,
      createdAt,
    ];
  }
}
