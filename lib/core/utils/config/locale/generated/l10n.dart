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

  /// `Create your own email`
  String get createYourOwnEmail {
    return Intl.message(
      'Create your own email',
      name: 'createYourOwnEmail',
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

  /// `The process has been cancelled`
  String get processHasBeenCancelled {
    return Intl.message(
      'The process has been cancelled',
      name: 'processHasBeenCancelled',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use.`
  String get thisEmailAlreadyExists {
    return Intl.message(
      'This email is already in use.',
      name: 'thisEmailAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `The password is very weak. Please use a stronger password.`
  String get thePasswordIsVeryWeak {
    return Intl.message(
      'The password is very weak. Please use a stronger password.',
      name: 'thePasswordIsVeryWeak',
      desc: '',
      args: [],
    );
  }

  /// `You can't use the same previous password.`
  String get youCanNotUseSamePreviousPassword {
    return Intl.message(
      'You can\'t use the same previous password.',
      name: 'youCanNotUseSamePreviousPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code`
  String get invalidVerificationCode {
    return Intl.message(
      'Invalid verification code',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `The verification code has expired. We have sent another code.`
  String get theVerificationCodeHasExpiredWeSentAnotherCode {
    return Intl.message(
      'The verification code has expired. We have sent another code.',
      name: 'theVerificationCodeHasExpiredWeSentAnotherCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification type.`
  String get invalidVerificationType {
    return Intl.message(
      'Invalid verification type.',
      name: 'invalidVerificationType',
      desc: '',
      args: [],
    );
  }

  /// `User is not email_password to make new pass`
  String get userNotEmailPasswordToNewPass {
    return Intl.message(
      'User is not email_password to make new pass',
      name: 'userNotEmailPasswordToNewPass',
      desc: '',
      args: [],
    );
  }

  /// `The password is changed from another device`
  String get thePassIsChangedFromAnotherDevice {
    return Intl.message(
      'The password is changed from another device',
      name: 'thePassIsChangedFromAnotherDevice',
      desc: '',
      args: [],
    );
  }

  /// `This user is not email and password provider to send verification code.`
  String get userNotEmailPasswordToSendVerificationCode {
    return Intl.message(
      'This user is not email and password provider to send verification code.',
      name: 'userNotEmailPasswordToSendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Security`
  String get privacyAndSecurity {
    return Intl.message(
      'Privacy & Security',
      name: 'privacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Status bar`
  String get statusBar {
    return Intl.message(
      'Status bar',
      name: 'statusBar',
      desc: '',
      args: [],
    );
  }

  /// `On lock screen`
  String get onLockScreen {
    return Intl.message(
      'On lock screen',
      name: 'onLockScreen',
      desc: '',
      args: [],
    );
  }

  /// `Pop ups`
  String get popUps {
    return Intl.message(
      'Pop ups',
      name: 'popUps',
      desc: '',
      args: [],
    );
  }

  /// `Theme mode`
  String get themeMode {
    return Intl.message(
      'Theme mode',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get lightMode {
    return Intl.message(
      'Light mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Device mode`
  String get deviceMode {
    return Intl.message(
      'Device mode',
      name: 'deviceMode',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get fontSize {
    return Intl.message(
      'Font size',
      name: 'fontSize',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get defaultScale {
    return Intl.message(
      'Default',
      name: 'defaultScale',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get large {
    return Intl.message(
      'Large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Extra Large`
  String get extraLarge {
    return Intl.message(
      'Extra Large',
      name: 'extraLarge',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Your groups`
  String get yourGroups {
    return Intl.message(
      'Your groups',
      name: 'yourGroups',
      desc: '',
      args: [],
    );
  }

  /// `Create another account`
  String get createAnotherAccount {
    return Intl.message(
      'Create another account',
      name: 'createAnotherAccount',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-type new Password`
  String get reTypeNewPassword {
    return Intl.message(
      'Re-type new Password',
      name: 'reTypeNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Feel free to create new groups.`
  String get youCanMakeNewGroups {
    return Intl.message(
      'Feel free to create new groups.',
      name: 'youCanMakeNewGroups',
      desc: '',
      args: [],
    );
  }

  /// `There are currently no notifications.`
  String get thereIsNoNotifications {
    return Intl.message(
      'There are currently no notifications.',
      name: 'thereIsNoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `If you log out now, you will lose all unsaved data. Are you sure you want to log out?`
  String get ifYouLogOutNowYouWillLoseAllUnsavedData {
    return Intl.message(
      'If you log out now, you will lose all unsaved data. Are you sure you want to log out?',
      name: 'ifYouLogOutNowYouWillLoseAllUnsavedData',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `{number} selected`
  String selectedWithNumber(int number) {
    return Intl.message(
      '$number selected',
      name: 'selectedWithNumber',
      desc: '',
      args: [number],
    );
  }

  /// `Exit groups`
  String get exitGroups {
    return Intl.message(
      'Exit groups',
      name: 'exitGroups',
      desc: '',
      args: [],
    );
  }

  /// `Mark as unread`
  String get markAsUnRead {
    return Intl.message(
      'Mark as unread',
      name: 'markAsUnRead',
      desc: '',
      args: [],
    );
  }

  /// `Select all`
  String get selectAll {
    return Intl.message(
      'Select all',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `Deselect all`
  String get deselectAll {
    return Intl.message(
      'Deselect all',
      name: 'deselectAll',
      desc: '',
      args: [],
    );
  }

  /// `Mute notification`
  String get muteNotification {
    return Intl.message(
      'Mute notification',
      name: 'muteNotification',
      desc: '',
      args: [],
    );
  }

  /// `Unmute notification`
  String get unmuteNotification {
    return Intl.message(
      'Unmute notification',
      name: 'unmuteNotification',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure about delete your account?`
  String get areYouSureAboutDeleteYourAccount {
    return Intl.message(
      'Are you sure about delete your account?',
      name: 'areYouSureAboutDeleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your account will remove all of your information from our database `
  String get deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase {
    return Intl.message(
      'Deleting your account will remove all of your information from our database ',
      name: 'deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Change name`
  String get changeName {
    return Intl.message(
      'Change name',
      name: 'changeName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Name changed successfully`
  String get nameChangedSuccessfully {
    return Intl.message(
      'Name changed successfully',
      name: 'nameChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Open camera`
  String get openCamera {
    return Intl.message(
      'Open camera',
      name: 'openCamera',
      desc: '',
      args: [],
    );
  }

  /// `Open gallery`
  String get openGallery {
    return Intl.message(
      'Open gallery',
      name: 'openGallery',
      desc: '',
      args: [],
    );
  }

  /// `Open files`
  String get openFiles {
    return Intl.message(
      'Open files',
      name: 'openFiles',
      desc: '',
      args: [],
    );
  }

  /// `The image you are trying to delete does not exist.`
  String get theImageYouAreTryingToDeleteDoesNotExist {
    return Intl.message(
      'The image you are trying to delete does not exist.',
      name: 'theImageYouAreTryingToDeleteDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `The uploaded file type is not supported. Please upload an image file.`
  String get theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile {
    return Intl.message(
      'The uploaded file type is not supported. Please upload an image file.',
      name: 'theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile',
      desc: '',
      args: [],
    );
  }

  /// `The uploaded file exceeds the maximum allowed size. Please upload a smaller file.`
  String
      get theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile {
    return Intl.message(
      'The uploaded file exceeds the maximum allowed size. Please upload a smaller file.',
      name:
          'theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile',
      desc: '',
      args: [],
    );
  }

  /// `User is not active. Please contact support for further assistance.`
  String get userIsNotActivePleaseContactSupportForFurtherAssistance {
    return Intl.message(
      'User is not active. Please contact support for further assistance.',
      name: 'userIsNotActivePleaseContactSupportForFurtherAssistance',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again later or contact support for assistance.`
  String get unknownErrorOccurred {
    return Intl.message(
      'An unknown error occurred. Please try again later or contact support for assistance.',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `The client took too long to send the request. Please check your network connection and try again.`
  String get clientTookTooLong {
    return Intl.message(
      'The client took too long to send the request. Please check your network connection and try again.',
      name: 'clientTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to send a response. Please try again later.`
  String get serverTookTooLong {
    return Intl.message(
      'The server took too long to send a response. Please try again later.',
      name: 'serverTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `The server's SSL certificate is not trusted. Please check your network connection or contact the server administrator.`
  String get sslCertificateNotTrusted {
    return Intl.message(
      'The server\'s SSL certificate is not trusted. Please check your network connection or contact the server administrator.',
      name: 'sslCertificateNotTrusted',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond. Please try again later.`
  String get serverTookTooLongToRespond {
    return Intl.message(
      'The server took too long to respond. Please try again later.',
      name: 'serverTookTooLongToRespond',
      desc: '',
      args: [],
    );
  }

  /// `Add directory`
  String get addDirectory {
    return Intl.message(
      'Add directory',
      name: 'addDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Add file or message`
  String get addFileOrMessage {
    return Intl.message(
      'Add file or message',
      name: 'addFileOrMessage',
      desc: '',
      args: [],
    );
  }

  /// `Block this user`
  String get blockThisUser {
    return Intl.message(
      'Block this user',
      name: 'blockThisUser',
      desc: '',
      args: [],
    );
  }

  /// `You've added the '{directoryName}' directory, but it's pending approval from the admin.`
  String youAddedDirNameDirectory(String directoryName) {
    return Intl.message(
      'You\'ve added the \'$directoryName\' directory, but it\'s pending approval from the admin.',
      name: 'youAddedDirNameDirectory',
      desc: '',
      args: [directoryName],
    );
  }

  /// `A member named '{userName}' has requested to add the '{directoryName}' directory here.`
  String userWantToAddDirectory(String directoryName, String userName) {
    return Intl.message(
      'A member named \'$userName\' has requested to add the \'$directoryName\' directory here.',
      name: 'userWantToAddDirectory',
      desc: '',
      args: [directoryName, userName],
    );
  }

  /// `What action would you like to take with the '{directoryName}' directory?`
  String whatDoYouWantToDoWithDirNameDirectory(String directoryName) {
    return Intl.message(
      'What action would you like to take with the \'$directoryName\' directory?',
      name: 'whatDoYouWantToDoWithDirNameDirectory',
      desc: '',
      args: [directoryName],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Add activity`
  String get addActivity {
    return Intl.message(
      'Add activity',
      name: 'addActivity',
      desc: '',
      args: [],
    );
  }

  /// `You've added the '{activityName}' activity, but it's pending approval from the admin.`
  String youAddedActivityName(String activityName) {
    return Intl.message(
      'You\'ve added the \'$activityName\' activity, but it\'s pending approval from the admin.',
      name: 'youAddedActivityName',
      desc: '',
      args: [activityName],
    );
  }

  /// `A member named '{userName}' has requested to add the '{activityName}' activity here.`
  String userWantToAddActivity(String activityName, String userName) {
    return Intl.message(
      'A member named \'$userName\' has requested to add the \'$activityName\' activity here.',
      name: 'userWantToAddActivity',
      desc: '',
      args: [activityName, userName],
    );
  }

  /// `What action would you like to take with the '{activityName}' activity?`
  String whatDoYouWantToDoWithThisActivity(String activityName) {
    return Intl.message(
      'What action would you like to take with the \'$activityName\' activity?',
      name: 'whatDoYouWantToDoWithThisActivity',
      desc: '',
      args: [activityName],
    );
  }

  /// `Double tap to edit`
  String get doubleTapToEdit {
    return Intl.message(
      'Double tap to edit',
      name: 'doubleTapToEdit',
      desc: '',
      args: [],
    );
  }

  /// `This action will also delete all activities within '{directoryName}'.`
  String itWillDeleteAllActivitiesInsideDirNameToo(String directoryName) {
    return Intl.message(
      'This action will also delete all activities within \'$directoryName\'.',
      name: 'itWillDeleteAllActivitiesInsideDirNameToo',
      desc: '',
      args: [directoryName],
    );
  }

  /// `This action will mark the '{directoryName}' directory as not approved, hiding it. You can approve it again later.`
  String itWillMarkDirNameAsNotApprovedHidden(String directoryName) {
    return Intl.message(
      'This action will mark the \'$directoryName\' directory as not approved, hiding it. You can approve it again later.',
      name: 'itWillMarkDirNameAsNotApprovedHidden',
      desc: '',
      args: [directoryName],
    );
  }

  /// `This action will approve the '{directoryName}' directory, making it visible to all members.`
  String itWillApproveDirectoryNameDirectory(String directoryName) {
    return Intl.message(
      'This action will approve the \'$directoryName\' directory, making it visible to all members.',
      name: 'itWillApproveDirectoryNameDirectory',
      desc: '',
      args: [directoryName],
    );
  }

  /// `You are about to block the member '{userName}' with the email '{userEmail}'. This action will prevent them from adding anything to the bot.`
  String youAreAboutToBlockMember(String userName, String userEmail) {
    return Intl.message(
      'You are about to block the member \'$userName\' with the email \'$userEmail\'. This action will prevent them from adding anything to the bot.',
      name: 'youAreAboutToBlockMember',
      desc: '',
      args: [userName, userEmail],
    );
  }

  /// `This action will delete the '{activity}' activity.`
  String itWillDeleteActivity(String activity) {
    return Intl.message(
      'This action will delete the \'$activity\' activity.',
      name: 'itWillDeleteActivity',
      desc: '',
      args: [activity],
    );
  }

  /// `This action will mark the '{activity}' activity as not approved, hiding it. You can approve it again later.`
  String itWillMakeActivityNotApprovedHidden(String activity) {
    return Intl.message(
      'This action will mark the \'$activity\' activity as not approved, hiding it. You can approve it again later.',
      name: 'itWillMakeActivityNotApprovedHidden',
      desc: '',
      args: [activity],
    );
  }

  /// `This action will approve the '{activity}' activity, making it visible to all members.`
  String itWillApproveActivity(String activity) {
    return Intl.message(
      'This action will approve the \'$activity\' activity, making it visible to all members.',
      name: 'itWillApproveActivity',
      desc: '',
      args: [activity],
    );
  }

  /// `You: `
  String get youWithColon {
    return Intl.message(
      'You: ',
      name: 'youWithColon',
      desc: '',
      args: [],
    );
  }

  /// `Your data will be awaiting approval from the administrator.`
  String get yourDataWillBeAwaitingApproval {
    return Intl.message(
      'Your data will be awaiting approval from the administrator.',
      name: 'yourDataWillBeAwaitingApproval',
      desc: '',
      args: [],
    );
  }

  /// `Only administrators are allowed to add new data.`
  String get onlyAdminsCanAddNewData {
    return Intl.message(
      'Only administrators are allowed to add new data.',
      name: 'onlyAdminsCanAddNewData',
      desc: '',
      args: [],
    );
  }

  /// `You are now able to add anything.`
  String get youCanNowAddAnything {
    return Intl.message(
      'You are now able to add anything.',
      name: 'youCanNowAddAnything',
      desc: '',
      args: [],
    );
  }

  /// `Add activity: message, image, or file...`
  String get addActivityMessageImageOrFile {
    return Intl.message(
      'Add activity: message, image, or file...',
      name: 'addActivityMessageImageOrFile',
      desc: '',
      args: [],
    );
  }

  /// `Enter directory name`
  String get addDirectoryName {
    return Intl.message(
      'Enter directory name',
      name: 'addDirectoryName',
      desc: '',
      args: [],
    );
  }

  /// `New group`
  String get newGroup {
    return Intl.message(
      'New group',
      name: 'newGroup',
      desc: '',
      args: [],
    );
  }

  /// `Add members`
  String get addMembers {
    return Intl.message(
      'Add members',
      name: 'addMembers',
      desc: '',
      args: [],
    );
  }

  /// `Search here...`
  String get searchHere {
    return Intl.message(
      'Search here...',
      name: 'searchHere',
      desc: '',
      args: [],
    );
  }

  /// `Group name...`
  String get groupName {
    return Intl.message(
      'Group name...',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Group permissions`
  String get groupPermissions {
    return Intl.message(
      'Group permissions',
      name: 'groupPermissions',
      desc: '',
      args: [],
    );
  }

  /// `Group discussion type`
  String get groupDiscussionType {
    return Intl.message(
      'Group discussion type',
      name: 'groupDiscussionType',
      desc: '',
      args: [],
    );
  }

  /// `Exist`
  String get exist {
    return Intl.message(
      'Exist',
      name: 'exist',
      desc: '',
      args: [],
    );
  }

  /// `Exist but closed`
  String get existButClosed {
    return Intl.message(
      'Exist but closed',
      name: 'existButClosed',
      desc: '',
      args: [],
    );
  }

  /// `Not exist`
  String get notExist {
    return Intl.message(
      'Not exist',
      name: 'notExist',
      desc: '',
      args: [],
    );
  }

  /// `Group access type`
  String get groupAccessType {
    return Intl.message(
      'Group access type',
      name: 'groupAccessType',
      desc: '',
      args: [],
    );
  }

  /// `Read & write with admin agreements`
  String get readWriteWithAdminAgreements {
    return Intl.message(
      'Read & write with admin agreements',
      name: 'readWriteWithAdminAgreements',
      desc: '',
      args: [],
    );
  }

  /// `Read & write`
  String get readWrite {
    return Intl.message(
      'Read & write',
      name: 'readWrite',
      desc: '',
      args: [],
    );
  }

  /// `Only read`
  String get readOnly {
    return Intl.message(
      'Only read',
      name: 'readOnly',
      desc: '',
      args: [],
    );
  }

  /// `Members: {count}`
  String membersCount(int count) {
    return Intl.message(
      'Members: $count',
      name: 'membersCount',
      desc: '',
      args: [count],
    );
  }

  /// `at {timeString}`
  String atTimeString(String timeString) {
    return Intl.message(
      'at $timeString',
      name: 'atTimeString',
      desc: '',
      args: [timeString],
    );
  }

  /// `Yesterday at {timeString}`
  String yesterdayAtTimeString(String timeString) {
    return Intl.message(
      'Yesterday at $timeString',
      name: 'yesterdayAtTimeString',
      desc: '',
      args: [timeString],
    );
  }

  /// `{dateString} at {timeString}`
  String dateTimeString(String timeString, String dateString) {
    return Intl.message(
      '$dateString at $timeString',
      name: 'dateTimeString',
      desc: '',
      args: [timeString, dateString],
    );
  }

  /// `Last logged in {dateString}`
  String lastLoginDateString(String dateString) {
    return Intl.message(
      'Last logged in $dateString',
      name: 'lastLoginDateString',
      desc: '',
      args: [dateString],
    );
  }

  /// `Media, and docs`
  String get mediaAndDocs {
    return Intl.message(
      'Media, and docs',
      name: 'mediaAndDocs',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `View all ({count} more)`
  String viewAllCountMore(int count) {
    return Intl.message(
      'View all ($count more)',
      name: 'viewAllCountMore',
      desc: '',
      args: [count],
    );
  }

  /// `DOCS`
  String get docs {
    return Intl.message(
      'DOCS',
      name: 'docs',
      desc: '',
      args: [],
    );
  }

  /// `MEDIA`
  String get media {
    return Intl.message(
      'MEDIA',
      name: 'media',
      desc: '',
      args: [],
    );
  }

  /// `Only group admins will know that you left the group.`
  String get onlyGroupAdminsWillKnow {
    return Intl.message(
      'Only group admins will know that you left the group.',
      name: 'onlyGroupAdminsWillKnow',
      desc: '',
      args: [],
    );
  }

  /// `Exit "{groupName}" group?`
  String exitGroupNameGroup(String groupName) {
    return Intl.message(
      'Exit "$groupName" group?',
      name: 'exitGroupNameGroup',
      desc: '',
      args: [groupName],
    );
  }

  /// `Group photo`
  String get groupPhoto {
    return Intl.message(
      'Group photo',
      name: 'groupPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Change group name`
  String get changeGroupName {
    return Intl.message(
      'Change group name',
      name: 'changeGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Enter group name`
  String get enterGroupName {
    return Intl.message(
      'Enter group name',
      name: 'enterGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Group • {count} members`
  String groupMembersCount(int count) {
    return Intl.message(
      'Group • $count members',
      name: 'groupMembersCount',
      desc: '',
      args: [count],
    );
  }

  /// `Exit group`
  String get exitGroup {
    return Intl.message(
      'Exit group',
      name: 'exitGroup',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss as admin`
  String get dismissAsAdmin {
    return Intl.message(
      'Dismiss as admin',
      name: 'dismissAsAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Promote to group admin`
  String get promoteGroupAdmin {
    return Intl.message(
      'Promote to group admin',
      name: 'promoteGroupAdmin',
      desc: '',
      args: [],
    );
  }

  /// `User does not have permission to perform this action.`
  String get userNoPermission {
    return Intl.message(
      'User does not have permission to perform this action.',
      name: 'userNoPermission',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting directory from database. Please try again later.`
  String get errorDeletingDirectory {
    return Intl.message(
      'Error deleting directory from database. Please try again later.',
      name: 'errorDeletingDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting activity from database. Please try again later.`
  String get errorDeletingActivity {
    return Intl.message(
      'Error deleting activity from database. Please try again later.',
      name: 'errorDeletingActivity',
      desc: '',
      args: [],
    );
  }

  /// `Unblock this user`
  String get unBlockThisUser {
    return Intl.message(
      'Unblock this user',
      name: 'unBlockThisUser',
      desc: '',
      args: [],
    );
  }

  /// `Activate vibration`
  String get activateVibration {
    return Intl.message(
      'Activate vibration',
      name: 'activateVibration',
      desc: '',
      args: [],
    );
  }

  /// `What action do you want to perform with this "{content}"?`
  String whatActionWithContent(String content) {
    return Intl.message(
      'What action do you want to perform with this "$content"?',
      name: 'whatActionWithContent',
      desc: '',
      args: [content],
    );
  }

  /// `Are you sure you want to exit from the groups " {groupsName} "?`
  String confirmExitGroups(String groupsName) {
    return Intl.message(
      'Are you sure you want to exit from the groups " $groupsName "?',
      name: 'confirmExitGroups',
      desc: '',
      args: [groupsName],
    );
  }

  /// `Are you sure you want to exit from the group " {groupName} "?`
  String confirmExitGroup(String groupName) {
    return Intl.message(
      'Are you sure you want to exit from the group " $groupName "?',
      name: 'confirmExitGroup',
      desc: '',
      args: [groupName],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
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
