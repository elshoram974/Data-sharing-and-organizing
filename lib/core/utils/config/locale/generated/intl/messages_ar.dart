// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(min) => "لا يمكن أن يكون أقل من ${min}";

  static String m1(max) => "لا يمكن أن يكون أكثر من ${max}";

  static String m2(activity) =>
      "هذا الإجراء سيعتمد نشاط \'${activity}\'، مما يجعله مرئيًا لجميع الأعضاء.";

  static String m3(directoryName) =>
      "سيقوم هذا الإجراء بالموافقة على المجلد \'${directoryName}\'، مما يجعله مرئيًا لجميع الأعضاء.";

  static String m4(activity) => "هذا الإجراء سيحذف نشاط \'${activity}\'.";

  static String m5(directoryName) =>
      "سيؤدي هذا الإجراء أيضًا إلى حذف جميع الأنشطة داخل \'${directoryName}\'.";

  static String m6(activity) =>
      "هذا الإجراء سيجعل نشاط \'${activity}\' غير معتمد ومخفي. يمكنك الموافقة عليه مرة أخرى لاحقًا.";

  static String m7(directoryName) =>
      "هذا الإجراء سيجعل المجلد \'${directoryName}\' غير معتمد ومخفي. يمكنك تفعيله مرة أخرى لاحقًا.";

  static String m8(number) => "تم تحديد ${number}";

  static String m9(activityName, userName) =>
      "طلب عضو يدعى \'${userName}\' إضافة نشاط \'${activityName}\' هنا.";

  static String m10(directoryName, userName) =>
      "عضو بإسم \'${userName}\' طلب إضافة المجلد \'${directoryName}\' هنا.";

  static String m11(directoryName) =>
      "ما الإجراء الذي تود اتخاذه مع مجلد \'${directoryName}\'؟";

  static String m12(activityName) =>
      "ما الإجراء الذي تود اتخاذه مع نشاط \'${activityName}\'؟";

  static String m13(activityName) =>
      "لقد قمت بإضافة نشاط \'${activityName}\', لكنه في انتظار موافقة المسئول.";

  static String m14(directoryName) =>
      "لقد أضفت مجلد \'${directoryName}\', لكنه في انتظار موافقة المسئول.";

  static String m15(userName, userEmail) =>
      "أنت على وشك حظر العضو \'${userName}\' الذي يحمل البريد الإلكتروني \'${userEmail}\'. سيمنع هذا الإجراء من إضافة أي شيء إلى الروبوت.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouHaveChooseTypeOfAccountPersonalOrBusiness":
            MessageLookupByLibrary.simpleMessage(
                "عليك تحديد ان كان الحساب خاص أو لشركة"),
        "addActivity": MessageLookupByLibrary.simpleMessage("إضافة نشاط"),
        "addDirectory": MessageLookupByLibrary.simpleMessage("إضافة مجلد"),
        "addFileOrMessage":
            MessageLookupByLibrary.simpleMessage("إضافة ملف أو رسالة"),
        "areYouSureAboutDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage("هل أنت متأكد من حذف حسابك؟"),
        "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد العودة؟"),
        "back": MessageLookupByLibrary.simpleMessage("رجوع"),
        "blockThisUser":
            MessageLookupByLibrary.simpleMessage("حظر هذا المستخدم"),
        "businessAccount": MessageLookupByLibrary.simpleMessage("حساب الشركة"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cantBeLessThan": m0,
        "cantBeMoreThan": m1,
        "changeName": MessageLookupByLibrary.simpleMessage("تغيير الاسم"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
            "العميل استغرق وقتًا طويلاً في إرسال الطلب. يرجى التحقق من اتصال الشبكة الخاص بك والمحاولة مرة أخرى."),
        "codeVerification":
            MessageLookupByLibrary.simpleMessage("تحقق من الرمز"),
        "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "createAnotherAccount":
            MessageLookupByLibrary.simpleMessage("إنشاء حساب آخر"),
        "createNewPassword":
            MessageLookupByLibrary.simpleMessage("إنشاء كلمة مرور جديدة"),
        "createYourOwnEmail":
            MessageLookupByLibrary.simpleMessage("أنشئ بريدك الإلكتروني الخاص"),
        "currentPassword":
            MessageLookupByLibrary.simpleMessage("كلمة المرور الحالية"),
        "darkMode": MessageLookupByLibrary.simpleMessage("الوضع المظلم"),
        "defaultScale": MessageLookupByLibrary.simpleMessage("افتراضي"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase":
            MessageLookupByLibrary.simpleMessage(
                "سيؤدي حذف حسابك إلى إزالة جميع معلوماتك من قاعدة بياناتنا"),
        "deselectAll": MessageLookupByLibrary.simpleMessage("إلغاء تحديد الكل"),
        "deviceMode": MessageLookupByLibrary.simpleMessage("وضع الجهاز"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب ؟ "),
        "doubleTapToEdit":
            MessageLookupByLibrary.simpleMessage("اضغط مرتين للتعديل"),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "editProfile":
            MessageLookupByLibrary.simpleMessage("تعديل الملف الشخصي"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الالكتروني"),
        "emailAddress":
            MessageLookupByLibrary.simpleMessage("عنوان البريد الإلكتروني"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "الحساب موجود بالفعل لهذا البريد الإلكتروني."),
        "emailYouEnteredDoesNotExist": MessageLookupByLibrary.simpleMessage(
            "البريد الإلكتروني الذي أدخلته غير موجود"),
        "enterDigitCodeThatHasBeenSentToYourEmail":
            MessageLookupByLibrary.simpleMessage(
                "أدخل الرمز المكون من 6 أرقام الذي تم إرساله إلى بريدك الإلكتروني"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("أدخل بريد إلكتروني صالح"),
        "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
            "أدخل بيانات اعتمادك للمتابعة."),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "errorInPassword":
            MessageLookupByLibrary.simpleMessage("خطأ في كلمة المرور"),
        "exitGroups":
            MessageLookupByLibrary.simpleMessage("الخروج من المجموعات"),
        "extraLarge": MessageLookupByLibrary.simpleMessage("كبير جداً"),
        "fillField": MessageLookupByLibrary.simpleMessage("املأ هذا الحقل"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "fontSize": MessageLookupByLibrary.simpleMessage("حجم الخط"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("هل نسيت كلمة المرور ؟ "),
        "goBack": MessageLookupByLibrary.simpleMessage("العودة"),
        "goTo": MessageLookupByLibrary.simpleMessage("اذهب الي"),
        "gotIt": MessageLookupByLibrary.simpleMessage("مفهوم"),
        "hide": MessageLookupByLibrary.simpleMessage("إخفاء"),
        "hidePassword":
            MessageLookupByLibrary.simpleMessage("إخفاء كلمة المرور"),
        "home": MessageLookupByLibrary.simpleMessage("الصفحة الرئيسية"),
        "ifYouLogOutNowYouWillLoseAllUnsavedData":
            MessageLookupByLibrary.simpleMessage(
                "إذا قمت بتسجيل الخروج الآن، ستفقد كل البيانات غير المحفوظة. هل أنت متأكد أنك تريد تسجيل الخروج؟"),
        "ifYouReturnNowYouWillLoseAllData":
            MessageLookupByLibrary.simpleMessage(
                "إذا قمت بالعودة الآن، ستفقد كل البيانات!"),
        "invalidVerificationCode":
            MessageLookupByLibrary.simpleMessage("رمز التحقيق غير صالح"),
        "invalidVerificationType":
            MessageLookupByLibrary.simpleMessage("نوع التحقق غير صالح"),
        "itWillApproveActivity": m2,
        "itWillApproveDirectoryNameDirectory": m3,
        "itWillDeleteActivity": m4,
        "itWillDeleteAllActivitiesInsideDirNameToo": m5,
        "itWillMakeActivityNotApprovedHidden": m6,
        "itWillMarkDirNameAsNotApprovedHidden": m7,
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "large": MessageLookupByLibrary.simpleMessage("كبير"),
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
        "lightMode": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "markAsUnRead":
            MessageLookupByLibrary.simpleMessage("وضع علامة كغير مقروء"),
        "menu": MessageLookupByLibrary.simpleMessage("القائمة"),
        "muteNotification":
            MessageLookupByLibrary.simpleMessage("كتم الإشعارات"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "nameChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تغيير الاسم بنجاح"),
        "newPassword": MessageLookupByLibrary.simpleMessage("كلمة مرور جديدة"),
        "noCodeReceived":
            MessageLookupByLibrary.simpleMessage("لم يتم استلام رمز؟ "),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("لا يوجد اتصال بالإنترنت"),
        "noNeed": MessageLookupByLibrary.simpleMessage("لا تحتاج للمساعدة؟ "),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("ليست نفس كلمة المرور"),
        "notification": MessageLookupByLibrary.simpleMessage("الإشعارات"),
        "oR": MessageLookupByLibrary.simpleMessage("أو"),
        "onLockScreen": MessageLookupByLibrary.simpleMessage("على شاشة القفل"),
        "openCamera": MessageLookupByLibrary.simpleMessage("فتح الكاميرا"),
        "openFiles": MessageLookupByLibrary.simpleMessage("فتح الملفات"),
        "openGallery": MessageLookupByLibrary.simpleMessage("فتح المعرض"),
        "orConnectUsing": MessageLookupByLibrary.simpleMessage(
            "أو قم بتسجيل الدخول باستخدام"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "personalAccount": MessageLookupByLibrary.simpleMessage("حساب خاص"),
        "popUps": MessageLookupByLibrary.simpleMessage("النوافذ المنبثقة"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("اضغط مرة أخرى للخروج"),
        "privacyAndSecurity":
            MessageLookupByLibrary.simpleMessage("الخصوصية والأمان"),
        "processHasBeenCancelled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء العملية"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "reTypeNewPassword": MessageLookupByLibrary.simpleMessage(
            "أعد كتابة كلمة المرور الجديدة"),
        "recover": MessageLookupByLibrary.simpleMessage("استعادة"),
        "recoverYourAccount":
            MessageLookupByLibrary.simpleMessage("استعادة حسابك"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
        "resend": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "selectAll": MessageLookupByLibrary.simpleMessage("تحديد الكل"),
        "selectedWithNumber": m8,
        "sendRequest": MessageLookupByLibrary.simpleMessage("إرسال الطلب"),
        "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
            "استغرق الخادم وقتًا طويلاً في إرسال الاستجابة. يرجى المحاولة مرة أخرى لاحقًا."),
        "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
            "استغرق الخادم وقتًا طويلاً في الرد. يرجى المحاولة مرة أخرى لاحقًا."),
        "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "sharikna": MessageLookupByLibrary.simpleMessage("شاركنا"),
        "showPassword":
            MessageLookupByLibrary.simpleMessage("إظهار كلمة المرور"),
        "signUp": MessageLookupByLibrary.simpleMessage("التسجيل"),
        "small": MessageLookupByLibrary.simpleMessage("صغير"),
        "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
            "شهادة SSL للخادم غير موثوق بها. يرجى التحقق من اتصال الشبكة الخاص بك أو الاتصال بمسؤول الخادم."),
        "statusBar": MessageLookupByLibrary.simpleMessage("شريط الحالة"),
        "stayHere": MessageLookupByLibrary.simpleMessage("ابق هنا"),
        "support": MessageLookupByLibrary.simpleMessage("الدعم"),
        "system": MessageLookupByLibrary.simpleMessage("النظام"),
        "theImageYouAreTryingToDeleteDoesNotExist":
            MessageLookupByLibrary.simpleMessage(
                "الصورة التي تحاول حذفها غير موجودة."),
        "thePassIsChangedFromAnotherDevice":
            MessageLookupByLibrary.simpleMessage(
                "تم تغيير الرقم السري من جهاز اخر"),
        "thePasswordIsVeryWeak": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور ضعيفة جدًا. يرجى استخدام كلمة مرور أقوى."),
        "theUploadedFileExceedsTheMaximumAllowedSizePleaseUploadSmallerFile":
            MessageLookupByLibrary.simpleMessage(
                "حجم الملف المرفوع يتجاوز الحد الأقصى المسموح به. يرجى تحميل ملف أصغر."),
        "theUploadedFileTypeIsNotSupportedPleaseUploadAnImageFile":
            MessageLookupByLibrary.simpleMessage(
                "نوع الملف المرفوع غير مدعوم. يرجى تحميل ملف صورة."),
        "theVerificationCodeHasExpiredWeSentAnotherCode":
            MessageLookupByLibrary.simpleMessage(
                "انتهت صلاحية رمز التحقق. لقد قمنا بإرسال رمز آخر."),
        "themeMode": MessageLookupByLibrary.simpleMessage("وضع المظهر"),
        "thereIsNoNotifications":
            MessageLookupByLibrary.simpleMessage("لا يوجد حاليًا أي إشعارات."),
        "thereIsProblemWithServerTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "هناك مشكلة في الخادم. حاول مرة أخرى لاحقًا."),
        "thisAccountExistWithAnotherProvider":
            MessageLookupByLibrary.simpleMessage(
                "هذا الحساب موجود ولكن مع مزود خدمة آخر."),
        "thisEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "هذا البريد الإلكتروني مستخدم بالفعل."),
        "today": MessageLookupByLibrary.simpleMessage("اليوم"),
        "type": MessageLookupByLibrary.simpleMessage("النوع"),
        "uHaveToVerifyAccountFirst":
            MessageLookupByLibrary.simpleMessage("يجب التحقق من حسابك أولاً"),
        "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ غير معروف. يرجى المحاولة مرة أخرى في وقت لاحق أو الاتصال بالدعم للمساعدة."),
        "unmuteNotification":
            MessageLookupByLibrary.simpleMessage("تفعيل الإشعارات"),
        "userIsNotActivePleaseContactSupportForFurtherAssistance":
            MessageLookupByLibrary.simpleMessage(
                "المستخدم غير نشط. يرجى الاتصال بالدعم للمساعدة الإضافية."),
        "userNotEmailPasswordToNewPass": MessageLookupByLibrary.simpleMessage(
            "المستخدم ليس عبارة عن حساب بالبريد الإلكتروني وكلمة مرور لتغيير كلمة المرور"),
        "userNotEmailPasswordToSendVerificationCode":
            MessageLookupByLibrary.simpleMessage(
                "هذا المستخدم ليس مزودًا ببريد إلكتروني وكلمة مرور لإرسال رمز التحقق."),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "لا يوجد مستخدم لهذا البريد الإلكتروني."),
        "userWantToAddActivity": m9,
        "userWantToAddDirectory": m10,
        "verify": MessageLookupByLibrary.simpleMessage("التحقق"),
        "verifyIt": MessageLookupByLibrary.simpleMessage("تحقق منه"),
        "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور المقدمة ضعيفة جدًا."),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("مرحبًا بعودتك!"),
        "whatDoYouWantToDoWithDirNameDirectory": m11,
        "whatDoYouWantToDoWithThisActivity": m12,
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "تم تقديم كلمة مرور خاطئة لهذا المستخدم."),
        "yesterday": MessageLookupByLibrary.simpleMessage("أمس"),
        "youAddedActivityName": m13,
        "youAddedDirNameDirectory": m14,
        "youAreAboutToBlockMember": m15,
        "youCanMakeNewGroups": MessageLookupByLibrary.simpleMessage(
            "بإمكانك إنشاء مجموعات جديدة بحرية."),
        "youCanNotUseSamePreviousPassword":
            MessageLookupByLibrary.simpleMessage(
                "لا يمكنك استخدام نفس كلمة المرور السابقة."),
        "youHaveToConfirmYourAccount":
            MessageLookupByLibrary.simpleMessage("يجب تأكيد حسابك"),
        "youWithColon": MessageLookupByLibrary.simpleMessage("أنت: "),
        "yourGroups": MessageLookupByLibrary.simpleMessage("مجموعاتك"),
        "yourNewPasswordMustBeDifferentFromPreviously":
            MessageLookupByLibrary.simpleMessage(
                "يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة سابقًا"),
        "yourRequestNotFoundTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "لم يتم العثور على طلبك. حاول مرة أخرى لاحقًا.")
      };
}
