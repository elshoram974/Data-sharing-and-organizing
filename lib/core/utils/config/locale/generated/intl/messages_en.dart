// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(min) => "Can\'t be less than ${min}";

  static String m1(max) => "Can\'t be more than ${max}";

  static String m2(number) => "${number} selected";

  static String m3(directionName, byUserId) =>
      "A user with the ID \'${byUserId}\' has requested to add the \'${directionName}\' direction here.";

  static String m4(directionName) =>
      "You\'ve added the \'${directionName}\' direction, but it\'s pending approval from the admin.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouHaveChooseTypeOfAccountPersonalOrBusiness":
            MessageLookupByLibrary.simpleMessage(
                "You have to choose the type of your account if it personal or business account."),
        "addDirectory": MessageLookupByLibrary.simpleMessage("Add directory"),
        "addFileOrMessage":
            MessageLookupByLibrary.simpleMessage("Add file or message"),
        "areYouSureAboutDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure about delete your account?"),
        "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to return back"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "blockThisUser":
            MessageLookupByLibrary.simpleMessage("Block this user"),
        "businessAccount":
            MessageLookupByLibrary.simpleMessage("Business account"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cantBeLessThan": m0,
        "cantBeMoreThan": m1,
        "changeName": MessageLookupByLibrary.simpleMessage("Change name"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
            "The client took too long to send the request. Please check your network connection and try again."),
        "codeVerification":
            MessageLookupByLibrary.simpleMessage("Code verification"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createAnotherAccount":
            MessageLookupByLibrary.simpleMessage("Create another account"),
        "createNewPassword":
            MessageLookupByLibrary.simpleMessage("Create new password"),
        "createYourOwnEmail":
            MessageLookupByLibrary.simpleMessage("Create your own email"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("Current Password"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark mode"),
        "defaultScale": MessageLookupByLibrary.simpleMessage("Default"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase":
            MessageLookupByLibrary.simpleMessage(
                "Deleting your account will remove all of your information from our database "),
        "deselectAll": MessageLookupByLibrary.simpleMessage("Deselect all"),
        "deviceMode": MessageLookupByLibrary.simpleMessage("Device mode"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ? "),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editProfile": MessageLookupByLibrary.simpleMessage("Edit profile"),
        "email": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email address"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "The account already exists for that email."),
        "emailYouEnteredDoesNotExist": MessageLookupByLibrary.simpleMessage(
            "The email you entered does not exist"),
        "enterDigitCodeThatHasBeenSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "Enter the 6-digit code that has been sent to your email"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid E-mail"),
        "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
            "Enter your credentials to continue."),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorInPassword":
            MessageLookupByLibrary.simpleMessage("Error in password"),
        "exitGroups": MessageLookupByLibrary.simpleMessage("Exit groups"),
        "extraLarge": MessageLookupByLibrary.simpleMessage("Extra Large"),
        "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "fontSize": MessageLookupByLibrary.simpleMessage("Font size"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password ? "),
        "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
        "goTo": MessageLookupByLibrary.simpleMessage("Go to"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got it"),
        "hidePassword": MessageLookupByLibrary.simpleMessage("Hide password"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "ifYouLogOutNowYouWillLoseAllUnsavedData":
            MessageLookupByLibrary.simpleMessage(
                "If you log out now, you will lose all unsaved data. Are you sure you want to log out?"),
        "ifYouReturnNowYouWillLoseAllData":
            MessageLookupByLibrary.simpleMessage(
                "If you return now, you will lose all data!"),
        "invalidVerificationCode":
            MessageLookupByLibrary.simpleMessage("Invalid verification code"),
        "invalidVerificationType":
            MessageLookupByLibrary.simpleMessage("Invalid verification type."),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "large": MessageLookupByLibrary.simpleMessage("Large"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lightMode": MessageLookupByLibrary.simpleMessage("Light mode"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "markAsUnRead": MessageLookupByLibrary.simpleMessage("Mark as unread"),
        "menu": MessageLookupByLibrary.simpleMessage("Menu"),
        "muteNotification":
            MessageLookupByLibrary.simpleMessage("Mute notification"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Name changed successfully"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "noCodeReceived":
            MessageLookupByLibrary.simpleMessage("No code received? "),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "noNeed": MessageLookupByLibrary.simpleMessage("No need ? "),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("Not same password"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "oR": MessageLookupByLibrary.simpleMessage("OR"),
        "onLockScreen": MessageLookupByLibrary.simpleMessage("On lock screen"),
        "openCamera": MessageLookupByLibrary.simpleMessage("Open camera"),
        "openFiles": MessageLookupByLibrary.simpleMessage("Open files"),
        "openGallery": MessageLookupByLibrary.simpleMessage("Open gallery"),
        "orConnectUsing":
            MessageLookupByLibrary.simpleMessage("Or connect using"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "personalAccount":
            MessageLookupByLibrary.simpleMessage("Personal account"),
        "popUps": MessageLookupByLibrary.simpleMessage("Pop ups"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit"),
        "privacyAndSecurity":
            MessageLookupByLibrary.simpleMessage("Privacy & Security"),
        "processHasBeenCancelled": MessageLookupByLibrary.simpleMessage(
            "The process has been cancelled"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "reTypeNewPassword":
            MessageLookupByLibrary.simpleMessage("Re-type new Password"),
        "recover": MessageLookupByLibrary.simpleMessage("Recover"),
        "recoverYourAccount":
            MessageLookupByLibrary.simpleMessage("Recover your account"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
        "selectedWithNumber": m2,
        "sendRequest": MessageLookupByLibrary.simpleMessage("Send request"),
        "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
            "The server took too long to send a response. Please try again later."),
        "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
            "The server took too long to respond. Please try again later."),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "sharikna": MessageLookupByLibrary.simpleMessage("Sharikna"),
        "showPassword": MessageLookupByLibrary.simpleMessage("Show password"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "small": MessageLookupByLibrary.simpleMessage("Small"),
        "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
            "The server\'s SSL certificate is not trusted. Please check your network connection or contact the server administrator."),
        "statusBar": MessageLookupByLibrary.simpleMessage("Status bar"),
        "stayHere": MessageLookupByLibrary.simpleMessage("Stay here"),
        "support": MessageLookupByLibrary.simpleMessage("Support"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "theImageYouAreTryingToDeleteDoesNotExist":
            MessageLookupByLibrary.simpleMessage(
                "The image you are trying to delete does not exist."),
        "thePassIsChangedFromAnotherDevice":
            MessageLookupByLibrary.simpleMessage(
                "The password is changed from another device"),
        "thePasswordIsVeryWeak": MessageLookupByLibrary.simpleMessage(
            "The password is very weak. Please use a stronger password."),
        "theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile":
            MessageLookupByLibrary.simpleMessage(
                "The uploaded file exceeds the maximum allowed size. Please upload a smaller file."),
        "theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile":
            MessageLookupByLibrary.simpleMessage(
                "The uploaded file type is not supported. Please upload an image file."),
        "theVerificationCodeHasExpiredWeSentAnotherCode":
            MessageLookupByLibrary.simpleMessage(
                "The verification code has expired. We have sent another code."),
        "themeMode": MessageLookupByLibrary.simpleMessage("Theme mode"),
        "thereIsNoNotifications": MessageLookupByLibrary.simpleMessage(
            "There are currently no notifications."),
        "thereIsProblemWithServerTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "There is a problem with the server. Try again later."),
        "thisAccountExistWithAnotherProvider":
            MessageLookupByLibrary.simpleMessage(
                "this account is exist but with another provider."),
        "thisEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "This email is already in use."),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "type": MessageLookupByLibrary.simpleMessage("Type"),
        "uHaveToVerifyAccountFirst": MessageLookupByLibrary.simpleMessage(
            "You have to verify your account first"),
        "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
            "An unknown error occurred. Please try again later or contact support for assistance."),
        "unmuteNotification":
            MessageLookupByLibrary.simpleMessage("Unmute notification"),
        "userIdWantToAddDirNameDirection": m3,
        "userIsNotActivePleaseContactSupportForFurtherAssistance":
            MessageLookupByLibrary.simpleMessage(
                "User is not active. Please contact support for further assistance."),
        "userNotEmailPasswordToNewPass": MessageLookupByLibrary.simpleMessage(
            "User is not email_password to make new pass"),
        "userNotEmailPasswordToSendVerificationCode":
            MessageLookupByLibrary.simpleMessage(
                "This user is not email and password provider to send verification code."),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyIt": MessageLookupByLibrary.simpleMessage("Verify it"),
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong password provided for that user."),
        "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
        "youAddedDirNameDirection": m4,
        "youCanMakeNewGroups": MessageLookupByLibrary.simpleMessage(
            "Feel free to create new groups."),
        "youCanNotUseSamePreviousPassword":
            MessageLookupByLibrary.simpleMessage(
                "You can\'t use the same previous password."),
        "youHaveToConfirmYourAccount": MessageLookupByLibrary.simpleMessage(
            "You have to confirm your account"),
        "yourGroups": MessageLookupByLibrary.simpleMessage("Your groups"),
        "yourNewPasswordMustBeDifferentFromPreviously":
            MessageLookupByLibrary.simpleMessage(
                "Your new password must be different from previously used password"),
        "yourRequestNotFoundTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "Your request was not found. Try again later.")
      };
}
