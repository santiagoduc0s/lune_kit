// ignore_for_file: prefer_const_constructors
import 'package:no_internet_connection/no_internet_connection.dart';
import 'package:test/test.dart';

void main() {
  group('NoInternetConnection', () {
    test('can be instantiated', () {
      expect(NoInternetConnection(), isNotNull);
    });
  });
}
