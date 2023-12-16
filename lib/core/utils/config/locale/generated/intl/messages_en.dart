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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "businessAccount":
            MessageLookupByLibrary.simpleMessage("Business account"),
        "cantBeLessThan": m0,
        "cantBeMoreThan": m1,
        "codeVerification":
            MessageLookupByLibrary.simpleMessage("Code verification"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createYourOwenEmail":
            MessageLookupByLibrary.simpleMessage("Create your owen email"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark mode"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ? "),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email address"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "The account already exists for that email."),
        "enterDigitCodeThatHasBeenSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "Enter the 6-digit code that has been sent to your email"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid E-mail"),
        "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
            "Enter your credentials to continue."),
        "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password ? "),
        "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
        "goTo": MessageLookupByLibrary.simpleMessage("Go to"),
        "hidePassword": MessageLookupByLibrary.simpleMessage("Hide password"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "noCodeReceived":
            MessageLookupByLibrary.simpleMessage("No code received? "),
        "noNeed": MessageLookupByLibrary.simpleMessage("No need ? "),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("Not same password"),
        "oR": MessageLookupByLibrary.simpleMessage("OR"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "personalAccount":
            MessageLookupByLibrary.simpleMessage("Personal account"),
        "recover": MessageLookupByLibrary.simpleMessage("Recover"),
        "recoverYourAccount":
            MessageLookupByLibrary.simpleMessage("Recover your account"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "sendRequest": MessageLookupByLibrary.simpleMessage("Send request"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "sharikna": MessageLookupByLibrary.simpleMessage("Sharikna"),
        "showPassword": MessageLookupByLibrary.simpleMessage("Show password"),
        "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong password provided for that user.")
      };
}
