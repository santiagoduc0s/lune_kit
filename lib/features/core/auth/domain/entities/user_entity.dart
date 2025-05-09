import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.updatedAt,
    required this.createdAt,
  });

  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photo;
  final DateTime updatedAt;
  final DateTime createdAt;

  /// Initials of the user
  String get initials {
    final f = firstName ?? '';
    final l = lastName ?? '';

    if (f.isEmpty || l.isEmpty) return '';

    return '${f[0]}${l[0]}'.toUpperCase();
  }

  String get fullName => '$firstName $lastName';

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'UserAuth(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photo: $photo, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      photo,
      updatedAt,
      createdAt,
    ];
  }
}
