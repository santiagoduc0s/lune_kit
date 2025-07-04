import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/data/models/models.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  DeviceRepositoryImpl({
    FirebaseFirestore? firestore,
    FirebaseAuth? firebaseAuth,
    DeviceInfoPlugin? deviceInfo,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _deviceInfo = deviceInfo ?? DeviceInfoPlugin();

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final DeviceInfoPlugin _deviceInfo;

  CollectionReference get _collection => _firestore
      .collection('users')
      .doc(_firebaseAuth.currentUser!.uid)
      .collection('devices');

  @override
  Future<DeviceEntity> getDevice() async {
    final deviceId = await _getDeviceId();
    final doc = await _collection.doc(deviceId).get();

    if (!doc.exists) {
      throw NotFoundException();
    }

    return DeviceModel.fromFirebase(doc);
  }

  @override
  Future<void> createDevice() async {
    final deviceId = await _getDeviceId();

    return _collection.doc(deviceId).set({
      'id': deviceId,
      'token': null,
      'notificationsAreEnabled': false,
      'dailyNotification': false,
      'weeklyNotification': false,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateDevice({
    String? token,
    bool? notificationsAreEnabled,
    bool? dailyNotification,
    bool? weeklyNotification,
  }) async {
    final deviceId = await _getDeviceId();

    final updates = <String, dynamic>{
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (token != null) {
      updates['token'] = token;
    }

    if (notificationsAreEnabled != null) {
      updates['notificationsAreEnabled'] = notificationsAreEnabled;
    }

    if (dailyNotification != null) {
      updates['dailyNotification'] = dailyNotification;
    }

    if (weeklyNotification != null) {
      updates['weeklyNotification'] = weeklyNotification;
    }

    await _collection.doc(deviceId).update(updates);
  }

  @override
  Future<void> deleteDevice() async {
    final deviceId = await _getDeviceId();
    await _collection.doc(deviceId).delete();
  }

  Future<String> _getDeviceId() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.modelName;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.model;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
