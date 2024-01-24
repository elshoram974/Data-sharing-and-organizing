// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sharikna`
  String get sharikna {
    return Intl.message(
      'Sharikna',
      name: 'sharikna',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Enter your credentials to continue.`
  String get enterYourCredentialsToContinue {
    return Intl.message(
      'Enter your credentials to continue.',
      name: 'enterYourCredentialsToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password ? `
  String get forgetPassword {
    return Intl.message(
      'Forget password ? ',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Recover`
  String get recover {
    return Intl.message(
      'Recover',
      name: 'recover',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get doNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Show password`
  String get showPassword {
    return Intl.message(
      'Show password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide password`
  String get hidePassword {
    return Intl.message(
      'Hide password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Go to`
  String get goTo {
    return Intl.message(
      'Go to',
      name: 'goTo',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Recover your account`
  String get recoverYourAccount {
    return Intl.message(
      'Recover your account',
      name: 'recoverYourAccount',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'enterYourEmailBelowToRequestPasswordRecovery.' key

  /// `Send request`
  String get sendRequest {
    return Intl.message(
      'Send request',
      name: 'sendRequest',
      desc: '',
      args: [],
    );
  }

  /// `No need ? `
  String get noNeed {
    return Intl.message(
      'No need ? ',
      name: 'noNeed',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBack {
    return Intl.message(
      'Go back',
      name: 'goBack',
      desc: '',
      args: [],
    );
  }

  /// `Code verification`
  String get codeVerification {
    return Intl.message(
      'Code verification',
      name: 'codeVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code that has been sent to your email`
  String get enterDigitCodeThatHasBeenSentToYourEmail {
    return Intl.message(
      'Enter the 6-digit code that has been sent to your email',
      name: 'enterDigitCodeThatHasBeenSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `No code received? `
  String get noCodeReceived {
    return Intl.message(
      'No code received? ',
      name: 'noCodeReceived',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Create your owen email`
  String get createYourOwenEmail {
    return Intl.message(
      'Create your owen email',
      name: 'createYourOwenEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Business account`
  String get businessAccount {
    return Intl.message(
      'Business account',
      name: 'businessAccount',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get oR {
    return Intl.message(
      'OR',
      name: 'oR',
      desc: '',
      args: [],
    );
  }

  /// `Personal account`
  String get personalAccount {
    return Intl.message(
      'Personal account',
      name: 'personalAccount',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get userNotFound {
    return Intl.message(
      'No user found for that email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPassword {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `fill this field`
  String get fillField {
    return Intl.message(
      'fill this field',
      name: 'fillField',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid E-mail`
  String get enterValidEmail {
    return Intl.message(
      'Enter valid E-mail',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Can't be less than {min}`
  String cantBeLessThan(Object min) {
    return Intl.message(
      'Can\'t be less than $min',
      name: 'cantBeLessThan',
      desc: '',
      args: [min],
    );
  }

  /// `Can't be more than {max}`
  String cantBeMoreThan(Object max) {
    return Intl.message(
      'Can\'t be more than $max',
      name: 'cantBeMoreThan',
      desc: '',
      args: [max],
    );
  }

  /// `Not same password`
  String get notSamePass {
    return Intl.message(
      'Not same password',
      name: 'notSamePass',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get createNewPassword {
    return Intl.message(
      'Create new password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previously used password`
  String get yourNewPasswordMustBeDifferentFromPreviously {
    return Intl.message(
      'Your new password must be different from previously used password',
      name: 'yourNewPasswordMustBeDifferentFromPreviously',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `You have to choose the type of your account if it personal or business account.`
  String get YouHaveChooseTypeOfAccountPersonalOrBusiness {
    return Intl.message(
      'You have to choose the type of your account if it personal or business account.',
      name: 'YouHaveChooseTypeOfAccountPersonalOrBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `You have to confirm your account`
  String get youHaveToConfirmYourAccount {
    return Intl.message(
      'You have to confirm your account',
      name: 'youHaveToConfirmYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Error in password`
  String get errorInPassword {
    return Intl.message(
      'Error in password',
      name: 'errorInPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email you entered does not exist`
  String get emailYouEnteredDoesNotExist {
    return Intl.message(
      'The email you entered does not exist',
      name: 'emailYouEnteredDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Your request was not found. Try again later.`
  String get yourRequestNotFoundTryAgainLater {
    return Intl.message(
      'Your request was not found. Try again later.',
      name: 'yourRequestNotFoundTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem with the server. Try again later.`
  String get thereIsProblemWithServerTryAgainLater {
    return Intl.message(
      'There is a problem with the server. Try again later.',
      name: 'thereIsProblemWithServerTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem with the server. Try again later.`
  String get thereIsAnErrorTryAgainLater {
    return Intl.message(
      'There is a problem with the server. Try again later.',
      name: 'thereIsAnErrorTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `this account is exist but with another provider.`
  String get thisAccountExistWithAnotherProvider {
    return Intl.message(
      'this account is exist but with another provider.',
      name: 'thisAccountExistWithAnotherProvider',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `If you return now, you will lose all data!`
  String get ifYouReturnNowYouWillLoseAllData {
    return Intl.message(
      'If you return now, you will lose all data!',
      name: 'ifYouReturnNowYouWillLoseAllData',
      desc: '',
      args: [],
    );
  }

  /// `Stay here`
  String get stayHere {
    return Intl.message(
      'Stay here',
      name: 'stayHere',
      desc: '',
      args: [],
    );
  }

  /// `You have to verify your account first`
  String get uHaveToVerifyAccountFirst {
    return Intl.message(
      'You have to verify your account first',
      name: 'uHaveToVerifyAccountFirst',
      desc: '',
      args: [],
    );
  }

  /// `Verify it`
  String get verifyIt {
    return Intl.message(
      'Verify it',
      name: 'verifyIt',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to return back`
  String get areYouSureYouWantToReturnBack {
    return Intl.message(
      'Are you sure you want to return back',
      name: 'areYouSureYouWantToReturnBack',
      desc: '',
      args: [],
    );
  }

  /// `Or connect using`
  String get orConnectUsing {
    return Intl.message(
      'Or connect using',
      name: 'orConnectUsing',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
