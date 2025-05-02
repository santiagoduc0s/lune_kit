// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Lune';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get email => 'Email';

  @override
  String get automatic => 'Automatic';

  @override
  String get system => 'System';

  @override
  String get save => 'Save';

  @override
  String get or => 'OR';

  @override
  String get biometric => 'Biometric';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get always => 'Always';

  @override
  String get never => 'Never';

  @override
  String get search => 'Search';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get done => 'Done';

  @override
  String get loading => 'Loading';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get tryAgain => 'Try again';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get logout => 'Logout';

  @override
  String get goBack => 'Go back';

  @override
  String get close => 'Close';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get change => 'Change';

  @override
  String get gotIt => 'Got it';

  @override
  String get accept => 'Accept';

  @override
  String get decline => 'Decline';

  @override
  String get enable => 'Enable';

  @override
  String get disable => 'Disable';

  @override
  String get welcome => 'Welcome';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get update => 'Update';

  @override
  String get readMore => 'Read more';

  @override
  String get readLess => 'Read less';

  @override
  String get join => 'Join';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get markAsUnread => 'Mark as unread';

  @override
  String get deleteAll => 'Delete all';

  @override
  String get markAllAsRead => 'Mark all as read';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'There are no notifications';

  @override
  String get empty => 'Empty';

  @override
  String get signOut => 'Sign Out';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get send => 'Send';

  @override
  String get open => 'Open';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get takePicture => 'Take Picture';

  @override
  String get deletePicture => 'Delete Picture';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get password => 'Password';

  @override
  String get repeatPassword => 'Repeat Password';

  @override
  String get forgotMyPassword => 'I forgot my password';

  @override
  String get signInWithGoogle => 'Sign In with Google';

  @override
  String get signInWithApple => 'Sign In with Apple';

  @override
  String get signInWithFacebook => 'Sign In with Facebook';

  @override
  String get connected => 'Connected';

  @override
  String get notConnected => 'No internet connection';

  @override
  String get generalError => 'An error occurred.';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String home_welcomeUser(String name) {
    return 'Hi, $name';
  }

  @override
  String get forgotPassword_emailSent => 'Email to reset password was sent';

  @override
  String get forgotPassword_title => 'Forgot Password';

  @override
  String get profile_userUpdated => 'Profile updated successfully';

  @override
  String get profile_messageActivePermission => 'We need your permission to use the camera';

  @override
  String get profile_imageUpdated => 'Image updated successfully';

  @override
  String get profile_imageDeleted => 'Image deleted successfully';

  @override
  String get signIn_emailDoesNotVerified => 'Please validate your email to continue';

  @override
  String get signIn_invalidCredential => 'Check your credentials';

  @override
  String get signIn_wrongPassword => 'Wrong password';

  @override
  String get signIn_userDisabled => 'User disabled';

  @override
  String get signIn_emailValidationSent => 'We sent you an email to verify your account';

  @override
  String get signUp_emailAlreadyInUse => 'The email is already in use';

  @override
  String get signUp_weakPassword => 'Password is too weak';

  @override
  String get signUp_InvalidEmailFormat => 'The email is invalid';

  @override
  String get lock_title => 'The app is locked';

  @override
  String get lock_description => 'Please, unlock the app to continue';

  @override
  String get lock_button => 'Unlock';

  @override
  String get lock_message => 'Authenticate to unlock the app';

  @override
  String get settings_titleConfirmDeleteAccount => 'This action is irreversible';

  @override
  String get settings_messageConfirmDeleteAccount => 'Before deleting your account, you must reauthenticate';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_languageSpanish => 'Spanish';

  @override
  String get settings_languageEnglish => 'English';

  @override
  String get settings_resetPassword => 'Reset Password';

  @override
  String get settings_newPassword => 'New Password';

  @override
  String get settings_passwordUpdated => 'Password updated successfully';

  @override
  String get settings_checkPassword => 'Check the current password';

  @override
  String get validation_any => 'At least one of the required fields must be filled.';

  @override
  String get validation_compare => 'The fields must match.';

  @override
  String get validation_contains => 'The input must contain the required value.';

  @override
  String get validation_creditCard => 'Please enter a valid credit card number.';

  @override
  String get validation_email => 'Please enter a valid email address.';

  @override
  String get validation_equals => 'The values do not match.';

  @override
  String validation_max(num max) {
    return 'Value must be less than or equal to $max.';
  }

  @override
  String validation_maxLength(int max) {
    return 'Maximum length is $max characters.';
  }

  @override
  String validation_min(num min) {
    return 'Value must be greater than or equal to $min.';
  }

  @override
  String validation_minLength(int min) {
    return 'Minimum length is $min characters.';
  }

  @override
  String get validation_mustMatch => 'The fields must match.';

  @override
  String get validation_number => 'Please enter a valid number.';

  @override
  String get validation_pattern => 'The input does not match the required pattern.';

  @override
  String get validation_required => 'This field is required.';

  @override
  String get validation_requiredTrue => 'This field must be selected.';

  @override
  String get exception_credentialAlreadyExists => 'Already exists an account with this email';

  @override
  String get biometricSwitcher_activate => 'Active Biometric';

  @override
  String get biometricSwitcher_activateConfirmation => 'Do you want to activate biometric?';

  @override
  String get biometricSwitcher_deactivate => 'Deactivate Biometric';

  @override
  String get biometricSwitcher_deactivateConfirmation => 'Do you want to deactivate biometric?';

  @override
  String get biometricSwitcher_activateAuthReason => 'Authenticate to active the biometric';

  @override
  String get biometricSwitcher_deactivateAuthReason => 'Authenticate to deactivate the biometric';

  @override
  String get biometricSwitcher_notSupported => 'Your device does not support biometric';

  @override
  String get biometricSwitcher_every15Seconds => 'Every 15 seconds';

  @override
  String get biometricSwitcher_every30Seconds => 'Every 30 seconds';

  @override
  String get biometricSwitcher_everyMinute => 'Every minute';

  @override
  String get biometricSwitcher_every2Minutes => 'Every 2 minutes';

  @override
  String get biometricSwitcher_every5Minutes => 'Every 5 minutes';

  @override
  String get biometricSwitcher_every15Minutes => 'Every 15 minutes';

  @override
  String get biometricSwitcher_everyHour => 'Every hour';

  @override
  String get biometricSwitcher_everyDay => 'Every day';
}
