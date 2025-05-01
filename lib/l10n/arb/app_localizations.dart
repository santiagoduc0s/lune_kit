import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Lune'**
  String get appName;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @automatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get automatic;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @biometric.
  ///
  /// In en, this message translates to:
  /// **'Biometric'**
  String get biometric;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @always.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get always;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// No description provided for @readLess.
  ///
  /// In en, this message translates to:
  /// **'Read less'**
  String get readLess;

  /// No description provided for @join.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get join;

  /// No description provided for @keyboard.
  ///
  /// In en, this message translates to:
  /// **'Keyboard'**
  String get keyboard;

  /// No description provided for @markAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark as read'**
  String get markAsRead;

  /// No description provided for @markAsUnread.
  ///
  /// In en, this message translates to:
  /// **'Mark as unread'**
  String get markAsUnread;

  /// No description provided for @deleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get deleteAll;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get markAllAsRead;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'There are no notifications'**
  String get noNotifications;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take Picture'**
  String get takePicture;

  /// No description provided for @deletePicture.
  ///
  /// In en, this message translates to:
  /// **'Delete Picture'**
  String get deletePicture;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get repeatPassword;

  /// No description provided for @forgotMyPassword.
  ///
  /// In en, this message translates to:
  /// **'I forgot my password'**
  String get forgotMyPassword;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Google'**
  String get signInWithGoogle;

  /// No description provided for @signInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Apple'**
  String get signInWithApple;

  /// No description provided for @signInWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Facebook'**
  String get signInWithFacebook;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @notConnected.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get notConnected;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred.'**
  String get generalError;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @home_welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}'**
  String home_welcomeUser(String name);

  /// No description provided for @forgotPassword_emailSent.
  ///
  /// In en, this message translates to:
  /// **'Email to reset password was sent'**
  String get forgotPassword_emailSent;

  /// No description provided for @forgotPassword_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword_title;

  /// No description provided for @profile_userUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profile_userUpdated;

  /// No description provided for @profile_messageActivePermission.
  ///
  /// In en, this message translates to:
  /// **'We need your permission to use the camera'**
  String get profile_messageActivePermission;

  /// No description provided for @profile_imageUpdated.
  ///
  /// In en, this message translates to:
  /// **'Image updated successfully'**
  String get profile_imageUpdated;

  /// No description provided for @profile_imageDeleted.
  ///
  /// In en, this message translates to:
  /// **'Image deleted successfully'**
  String get profile_imageDeleted;

  /// No description provided for @signIn_emailDoesNotVerified.
  ///
  /// In en, this message translates to:
  /// **'Please validate your email to continue'**
  String get signIn_emailDoesNotVerified;

  /// No description provided for @signIn_invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Check your credentials'**
  String get signIn_invalidCredential;

  /// No description provided for @signIn_wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password'**
  String get signIn_wrongPassword;

  /// No description provided for @signIn_userDisabled.
  ///
  /// In en, this message translates to:
  /// **'User disabled'**
  String get signIn_userDisabled;

  /// No description provided for @signIn_emailValidationSent.
  ///
  /// In en, this message translates to:
  /// **'We sent you an email to verify your account'**
  String get signIn_emailValidationSent;

  /// No description provided for @signUp_emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The email is already in use'**
  String get signUp_emailAlreadyInUse;

  /// No description provided for @signUp_weakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak'**
  String get signUp_weakPassword;

  /// No description provided for @signUp_InvalidEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'The email is invalid'**
  String get signUp_InvalidEmailFormat;

  /// No description provided for @lock_title.
  ///
  /// In en, this message translates to:
  /// **'The app is locked'**
  String get lock_title;

  /// No description provided for @lock_description.
  ///
  /// In en, this message translates to:
  /// **'Please, unlock the app to continue'**
  String get lock_description;

  /// No description provided for @lock_button.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get lock_button;

  /// No description provided for @lock_message.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to unlock the app'**
  String get lock_message;

  /// No description provided for @settings_titleConfirmDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible'**
  String get settings_titleConfirmDeleteAccount;

  /// No description provided for @settings_messageConfirmDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Before deleting your account, you must reauthenticate'**
  String get settings_messageConfirmDeleteAccount;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get settings_languageSpanish;

  /// No description provided for @settings_languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settings_languageEnglish;

  /// No description provided for @settings_resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get settings_resetPassword;

  /// No description provided for @settings_newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get settings_newPassword;

  /// No description provided for @settings_passwordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get settings_passwordUpdated;

  /// No description provided for @settings_checkPassword.
  ///
  /// In en, this message translates to:
  /// **'Check the current password'**
  String get settings_checkPassword;

  /// No description provided for @validation_any.
  ///
  /// In en, this message translates to:
  /// **'At least one of the required fields must be filled.'**
  String get validation_any;

  /// No description provided for @validation_compare.
  ///
  /// In en, this message translates to:
  /// **'The fields must match.'**
  String get validation_compare;

  /// No description provided for @validation_contains.
  ///
  /// In en, this message translates to:
  /// **'The input must contain the required value.'**
  String get validation_contains;

  /// No description provided for @validation_creditCard.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid credit card number.'**
  String get validation_creditCard;

  /// No description provided for @validation_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validation_email;

  /// No description provided for @validation_equals.
  ///
  /// In en, this message translates to:
  /// **'The values do not match.'**
  String get validation_equals;

  /// No description provided for @validation_max.
  ///
  /// In en, this message translates to:
  /// **'Value must be less than or equal to {max}.'**
  String validation_max(num max);

  /// No description provided for @validation_maxLength.
  ///
  /// In en, this message translates to:
  /// **'Maximum length is {max} characters.'**
  String validation_maxLength(int max);

  /// No description provided for @validation_min.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater than or equal to {min}.'**
  String validation_min(num min);

  /// No description provided for @validation_minLength.
  ///
  /// In en, this message translates to:
  /// **'Minimum length is {min} characters.'**
  String validation_minLength(int min);

  /// No description provided for @validation_mustMatch.
  ///
  /// In en, this message translates to:
  /// **'The fields must match.'**
  String get validation_mustMatch;

  /// No description provided for @validation_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number.'**
  String get validation_number;

  /// No description provided for @validation_pattern.
  ///
  /// In en, this message translates to:
  /// **'The input does not match the required pattern.'**
  String get validation_pattern;

  /// No description provided for @validation_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get validation_required;

  /// No description provided for @validation_requiredTrue.
  ///
  /// In en, this message translates to:
  /// **'This field must be selected.'**
  String get validation_requiredTrue;

  /// No description provided for @exception_credentialAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Already exists an account with this email'**
  String get exception_credentialAlreadyExists;

  /// No description provided for @biometricSwitcher_activate.
  ///
  /// In en, this message translates to:
  /// **'Active Biometric'**
  String get biometricSwitcher_activate;

  /// No description provided for @biometricSwitcher_activateConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to activate biometric?'**
  String get biometricSwitcher_activateConfirmation;

  /// No description provided for @biometricSwitcher_deactivate.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Biometric'**
  String get biometricSwitcher_deactivate;

  /// No description provided for @biometricSwitcher_deactivateConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you want to deactivate biometric?'**
  String get biometricSwitcher_deactivateConfirmation;

  /// No description provided for @biometricSwitcher_activateAuthReason.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to active the biometric'**
  String get biometricSwitcher_activateAuthReason;

  /// No description provided for @biometricSwitcher_deactivateAuthReason.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to deactivate the biometric'**
  String get biometricSwitcher_deactivateAuthReason;

  /// No description provided for @biometricSwitcher_notSupported.
  ///
  /// In en, this message translates to:
  /// **'Your device does not support biometric'**
  String get biometricSwitcher_notSupported;

  /// No description provided for @biometricSwitcher_every15Seconds.
  ///
  /// In en, this message translates to:
  /// **'Every 15 seconds'**
  String get biometricSwitcher_every15Seconds;

  /// No description provided for @biometricSwitcher_every30Seconds.
  ///
  /// In en, this message translates to:
  /// **'Every 30 seconds'**
  String get biometricSwitcher_every30Seconds;

  /// No description provided for @biometricSwitcher_everyMinute.
  ///
  /// In en, this message translates to:
  /// **'Every minute'**
  String get biometricSwitcher_everyMinute;

  /// No description provided for @biometricSwitcher_every2Minutes.
  ///
  /// In en, this message translates to:
  /// **'Every 2 minutes'**
  String get biometricSwitcher_every2Minutes;

  /// No description provided for @biometricSwitcher_every5Minutes.
  ///
  /// In en, this message translates to:
  /// **'Every 5 minutes'**
  String get biometricSwitcher_every5Minutes;

  /// No description provided for @biometricSwitcher_every15Minutes.
  ///
  /// In en, this message translates to:
  /// **'Every 15 minutes'**
  String get biometricSwitcher_every15Minutes;

  /// No description provided for @biometricSwitcher_everyHour.
  ///
  /// In en, this message translates to:
  /// **'Every hour'**
  String get biometricSwitcher_everyHour;

  /// No description provided for @biometricSwitcher_everyDay.
  ///
  /// In en, this message translates to:
  /// **'Every day'**
  String get biometricSwitcher_everyDay;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
