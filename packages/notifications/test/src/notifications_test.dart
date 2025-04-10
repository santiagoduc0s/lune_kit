// ignore_for_file: prefer_const_constructors
import 'package:notifications/notifications.dart';
import 'package:test/test.dart';

void main() {
  group('Notifications', () {
    test('can be instantiated', () {
      expect(Notifications(), isNotNull);
    });
  });
}
