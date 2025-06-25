import 'package:equatable/equatable.dart';

class DeviceEntity extends Equatable {
  const DeviceEntity({
    required this.id,
    required this.token,
    required this.notificationsAreEnabled,
    required this.dailyNotification,
    required this.weeklyNotification,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String? token;
  final bool notificationsAreEnabled;
  final bool dailyNotification;
  final bool weeklyNotification;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DeviceEntity copyWith({
    String? id,
    String? token,
    bool? notificationsAreEnabled,
    bool? dailyNotification,
    bool? weeklyNotification,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DeviceEntity(
      id: id ?? this.id,
      token: token ?? this.token,
      notificationsAreEnabled:
          notificationsAreEnabled ?? this.notificationsAreEnabled,
      dailyNotification: dailyNotification ?? this.dailyNotification,
      weeklyNotification: weeklyNotification ?? this.weeklyNotification,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      token,
      notificationsAreEnabled,
      dailyNotification,
      weeklyNotification,
      createdAt,
      updatedAt,
    ];
  }
}
