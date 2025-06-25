import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lune/domain/entities/entities.dart';

class DeviceModel extends DeviceEntity {
  const DeviceModel({
    required super.id,
    required super.token,
    required super.notificationsAreEnabled,
    required super.dailyNotification,
    required super.weeklyNotification,
    required super.createdAt,
    required super.updatedAt,
  });

  factory DeviceModel.fromFirebase(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return DeviceModel(
      id: data['id'] as String,
      token: data['token'] as String?,
      notificationsAreEnabled: data['notificationsAreEnabled'] as bool,
      dailyNotification: data['dailyNotification'] as bool,
      weeklyNotification: data['weeklyNotification'] as bool,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'notificationsAreEnabled': notificationsAreEnabled,
      'dailyNotification': dailyNotification,
      'weeklyNotification': weeklyNotification,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }
}
