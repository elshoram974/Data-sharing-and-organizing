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

  static String m0(timeString) => "at ${timeString}";

  static String m1(min) => "Can\'t be less than ${min}";

  static String m2(max) => "Can\'t be more than ${max}";

  static String m3(groupName) =>
      "Are you sure you want to exit from the group \" ${groupName} \"?";

  static String m4(groupsName) =>
      "Are you sure you want to exit from the groups \" ${groupsName} \"?";

  static String m5(timeString, dateString) => "${dateString} at ${timeString}";

  static String m6(groupName) => "Exit \"${groupName}\" group?";

  static String m7(count) => "Group • ${count} members";

  static String m8(activity) =>
      "This action will approve the \'${activity}\' activity, making it visible to all members.";

  static String m9(directoryName) =>
      "This action will approve the \'${directoryName}\' directory, making it visible to all members.";

  static String m10(activity) =>
      "This action will delete the \'${activity}\' activity.";

  static String m11(directoryName) =>
      "This action will also delete all activities within \'${directoryName}\'.";

  static String m12(activity) =>
      "This action will mark the \'${activity}\' activity as not approved, hiding it. You can approve it again later.";

  static String m13(directoryName) =>
      "This action will mark the \'${directoryName}\' directory as not approved, hiding it. You can approve it again later.";

  static String m14(dateString) => "Last logged in ${dateString}";

  static String m15(count) => "Members: ${count}";

  static String m16(number) => "${number} selected";

  static String m17(activityName, userName) =>
      "A member named \'${userName}\' has requested to add the \'${activityName}\' activity here.";

  static String m18(directoryName, userName) =>
      "A member named \'${userName}\' has requested to add the \'${directoryName}\' directory here.";

  static String m19(count) => "View all (${count} more)";

  static String m20(content) =>
      "What action do you want to perform with this \"${content}\"?";

  static String m21(directoryName) =>
      "What action would you like to take with the \'${directoryName}\' directory?";

  static String m22(activityName) =>
      "What action would you like to take with the \'${activityName}\' activity?";

  static String m23(timeString) => "Yesterday at ${timeString}";

  static String m24(activityName) =>
      "You\'ve added the \'${activityName}\' activity, but it\'s pending approval from the admin.";

  static String m25(directoryName) =>
      "You\'ve added the \'${directoryName}\' directory, but it\'s pending approval from the admin.";

  static String m26(userName, userEmail) =>
      "You are about to block the member \'${userName}\' with the email \'${userEmail}\'. This action will prevent them from adding anything to the bot.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouHaveChooseTypeOfAccountPersonalOrBusiness":
            MessageLookupByLibrary.simpleMessage(
                "You have to choose the type of your account if it personal or business account."),
        "activateVibration":
            MessageLookupByLibrary.simpleMessage("Activate vibration"),
        "addActivity": MessageLookupByLibrary.simpleMessage("Add activity"),
        "addActivityMessageImageOrFile": MessageLookupByLibrary.simpleMessage(
            "Add activity: message, image, or file..."),
        "addDirectory": MessageLookupByLibrary.simpleMessage("Add directory"),
        "addDirectoryName":
            MessageLookupByLibrary.simpleMessage("Enter directory name"),
        "addFileOrMessage":
            MessageLookupByLibrary.simpleMessage("Add file or message"),
        "addMembers": MessageLookupByLibrary.simpleMessage("Add members"),
        "admin": MessageLookupByLibrary.simpleMessage("Admin"),
        "areYouSureAboutDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure about delete your account?"),
        "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to return back"),
        "atTimeString": m0,
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "blockThisUser":
            MessageLookupByLibrary.simpleMessage("Block this user"),
        "businessAccount":
            MessageLookupByLibrary.simpleMessage("Business account"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cantBeLessThan": m1,
        "cantBeMoreThan": m2,
        "changeGroupName":
            MessageLookupByLibrary.simpleMessage("Change group name"),
        "changeName": MessageLookupByLibrary.simpleMessage("Change name"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
            "The client took too long to send the request. Please check your network connection and try again."),
        "codeVerification":
            MessageLookupByLibrary.simpleMessage("Code verification"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmExitGroup": m3,
        "confirmExitGroups": m4,
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
        "dateTimeString": m5,
        "defaultScale": MessageLookupByLibrary.simpleMessage("Default"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete account"),
        "deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase":
            MessageLookupByLibrary.simpleMessage(
                "Deleting your account will remove all of your information from our database "),
        "deselectAll": MessageLookupByLibrary.simpleMessage("Deselect all"),
        "deviceMode": MessageLookupByLibrary.simpleMessage("Device mode"),
        "dismissAsAdmin":
            MessageLookupByLibrary.simpleMessage("Dismiss as admin"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ? "),
        "docs": MessageLookupByLibrary.simpleMessage("DOCS"),
        "doubleTapToEdit":
            MessageLookupByLibrary.simpleMessage("Double tap to edit"),
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
        "enterGroupName":
            MessageLookupByLibrary.simpleMessage("Enter group name"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("Enter valid E-mail"),
        "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
            "Enter your credentials to continue."),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "errorDeletingActivity": MessageLookupByLibrary.simpleMessage(
            "Error deleting activity from database. Please try again later."),
        "errorDeletingDirectory": MessageLookupByLibrary.simpleMessage(
            "Error deleting directory from database. Please try again later."),
        "errorInPassword":
            MessageLookupByLibrary.simpleMessage("Error in password"),
        "exist": MessageLookupByLibrary.simpleMessage("Exist"),
        "existButClosed":
            MessageLookupByLibrary.simpleMessage("Exist but closed"),
        "exitGroup": MessageLookupByLibrary.simpleMessage("Exit group"),
        "exitGroupNameGroup": m6,
        "exitGroups": MessageLookupByLibrary.simpleMessage("Exit groups"),
        "extraLarge": MessageLookupByLibrary.simpleMessage("Extra Large"),
        "file": MessageLookupByLibrary.simpleMessage("File"),
        "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name"),
        "fontSize": MessageLookupByLibrary.simpleMessage("Font size"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password ? "),
        "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
        "goTo": MessageLookupByLibrary.simpleMessage("Go to"),
        "gotIt": MessageLookupByLibrary.simpleMessage("Got it"),
        "groupAccessType":
            MessageLookupByLibrary.simpleMessage("Group access type"),
        "groupDiscussionType":
            MessageLookupByLibrary.simpleMessage("Group discussion type"),
        "groupMembersCount": m7,
        "groupName": MessageLookupByLibrary.simpleMessage("Group name..."),
        "groupPermissions":
            MessageLookupByLibrary.simpleMessage("Group permissions"),
        "groupPhoto": MessageLookupByLibrary.simpleMessage("Group photo"),
        "hide": MessageLookupByLibrary.simpleMessage("Hide"),
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
        "itWillApproveActivity": m8,
        "itWillApproveDirectoryNameDirectory": m9,
        "itWillDeleteActivity": m10,
        "itWillDeleteAllActivitiesInsideDirNameToo": m11,
        "itWillMakeActivityNotApprovedHidden": m12,
        "itWillMarkDirNameAsNotApprovedHidden": m13,
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "large": MessageLookupByLibrary.simpleMessage("Large"),
        "lastLoginDateString": m14,
        "lastName": MessageLookupByLibrary.simpleMessage("Last name"),
        "lightMode": MessageLookupByLibrary.simpleMessage("Light mode"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "markAsUnRead": MessageLookupByLibrary.simpleMessage("Mark as unread"),
        "media": MessageLookupByLibrary.simpleMessage("MEDIA"),
        "mediaAndDocs": MessageLookupByLibrary.simpleMessage("Media, and docs"),
        "membersCount": m15,
        "menu": MessageLookupByLibrary.simpleMessage("Menu"),
        "muteNotification":
            MessageLookupByLibrary.simpleMessage("Mute notification"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "nameChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("Name changed successfully"),
        "newGroup": MessageLookupByLibrary.simpleMessage("New group"),
        "newPassword": MessageLookupByLibrary.simpleMessage("New password"),
        "noCodeReceived":
            MessageLookupByLibrary.simpleMessage("No code received? "),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "noNeed": MessageLookupByLibrary.simpleMessage("No need ? "),
        "notExist": MessageLookupByLibrary.simpleMessage("Not exist"),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("Not same password"),
        "notification": MessageLookupByLibrary.simpleMessage("Notification"),
        "oR": MessageLookupByLibrary.simpleMessage("OR"),
        "onLockScreen": MessageLookupByLibrary.simpleMessage("On lock screen"),
        "onlyAdminsCanAddNewData": MessageLookupByLibrary.simpleMessage(
            "Only administrators are allowed to add new data."),
        "onlyGroupAdminsWillKnow": MessageLookupByLibrary.simpleMessage(
            "Only group admins will know that you left the group."),
        "openCamera": MessageLookupByLibrary.simpleMessage("Open camera"),
        "openFiles": MessageLookupByLibrary.simpleMessage("Open files"),
        "openGallery": MessageLookupByLibrary.simpleMessage("Open gallery"),
        "orConnectUsing":
            MessageLookupByLibrary.simpleMessage("Or connect using"),
        "owner": MessageLookupByLibrary.simpleMessage("Owner"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "personalAccount":
            MessageLookupByLibrary.simpleMessage("Personal account"),
        "photo": MessageLookupByLibrary.simpleMessage("Photo"),
        "popUps": MessageLookupByLibrary.simpleMessage("Pop ups"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("Press again to exit"),
        "privacyAndSecurity":
            MessageLookupByLibrary.simpleMessage("Privacy & Security"),
        "processHasBeenCancelled": MessageLookupByLibrary.simpleMessage(
            "The process has been cancelled"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "promoteGroupAdmin":
            MessageLookupByLibrary.simpleMessage("Promote to group admin"),
        "reTypeNewPassword":
            MessageLookupByLibrary.simpleMessage("Re-type new Password"),
        "readOnly": MessageLookupByLibrary.simpleMessage("Only read"),
        "readWrite": MessageLookupByLibrary.simpleMessage("Read & write"),
        "readWriteWithAdminAgreements": MessageLookupByLibrary.simpleMessage(
            "Read & write with admin agreements"),
        "recover": MessageLookupByLibrary.simpleMessage("Recover"),
        "recoverYourAccount":
            MessageLookupByLibrary.simpleMessage("Recover your account"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
        "remove": MessageLookupByLibrary.simpleMessage("Remove"),
        "resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "searchHere": MessageLookupByLibrary.simpleMessage("Search here..."),
        "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
        "selectedWithNumber": m16,
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
        "unBlockThisUser":
            MessageLookupByLibrary.simpleMessage("Unblock this user"),
        "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
            "An unknown error occurred. Please try again later or contact support for assistance."),
        "unmuteNotification":
            MessageLookupByLibrary.simpleMessage("Unmute notification"),
        "userIsNotActivePleaseContactSupportForFurtherAssistance":
            MessageLookupByLibrary.simpleMessage(
                "User is not active. Please contact support for further assistance."),
        "userNoPermission": MessageLookupByLibrary.simpleMessage(
            "User does not have permission to perform this action."),
        "userNotEmailPasswordToNewPass": MessageLookupByLibrary.simpleMessage(
            "User is not email_password to make new pass"),
        "userNotEmailPasswordToSendVerificationCode":
            MessageLookupByLibrary.simpleMessage(
                "This user is not email and password provider to send verification code."),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "No user found for that email."),
        "userWantToAddActivity": m17,
        "userWantToAddDirectory": m18,
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyIt": MessageLookupByLibrary.simpleMessage("Verify it"),
        "viewAllCountMore": m19,
        "warning": MessageLookupByLibrary.simpleMessage("Warning"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
        "whatActionWithContent": m20,
        "whatDoYouWantToDoWithDirNameDirectory": m21,
        "whatDoYouWantToDoWithThisActivity": m22,
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "Wrong password provided for that user."),
        "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
        "yesterdayAtTimeString": m23,
        "you": MessageLookupByLibrary.simpleMessage("You"),
        "youAddedActivityName": m24,
        "youAddedDirNameDirectory": m25,
        "youAreAboutToBlockMember": m26,
        "youCanMakeNewGroups": MessageLookupByLibrary.simpleMessage(
            "Feel free to create new groups."),
        "youCanNotUseSamePreviousPassword":
            MessageLookupByLibrary.simpleMessage(
                "You can\'t use the same previous password."),
        "youCanNowAddAnything": MessageLookupByLibrary.simpleMessage(
            "You are now able to add anything."),
        "youHaveToConfirmYourAccount": MessageLookupByLibrary.simpleMessage(
            "You have to confirm your account"),
        "youWithColon": MessageLookupByLibrary.simpleMessage("You: "),
        "yourDataWillBeAwaitingApproval": MessageLookupByLibrary.simpleMessage(
            "Your data will be awaiting approval from the administrator."),
        "yourGroups": MessageLookupByLibrary.simpleMessage("Your groups"),
        "yourNewPasswordMustBeDifferentFromPreviously":
            MessageLookupByLibrary.simpleMessage(
                "Your new password must be different from previously used password"),
        "yourRequestNotFoundTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "Your request was not found. Try again later.")
      };
}
