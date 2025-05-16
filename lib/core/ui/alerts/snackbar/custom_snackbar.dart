import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class CustomSnackbar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    SnackBar Function(BuildContext) snackbar, {
    BuildContext? context,
  });
}
