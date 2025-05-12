import 'package:lune/features/core/app_preference/injections.dart';
import 'package:lune/features/core/auth/injections.dart';
import 'package:lune/features/screens/public_onboard/injections.dart';

Future<void> featureInjections() async {
  await appPreferenceInjections();
  await publicOnboardInjections();
  await authInjections();
}
