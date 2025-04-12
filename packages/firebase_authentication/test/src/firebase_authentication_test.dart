// ignore_for_file: prefer_const_constructors
import 'package:firebase_authentication/firebase_authentication.dart';
import 'package:test/test.dart';

void main() {
  group('FirebaseAuthentication', () {
    test('can be instantiated', () {
      expect(FirebaseAuthentication(), isNotNull);
    });
  });
}
