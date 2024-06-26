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

  static String m0(timeString) => "في ${timeString}";

  static String m1(min) => "لا يمكن أن يكون أقل من ${min}";

  static String m2(max) => "لا يمكن أن يكون أكثر من ${max}";

  static String m3(groupName) =>
      "هل أنت متأكد أنك تريد الخروج من المجموعة \" ${groupName} \"؟";

  static String m4(groupsName) =>
      "هل أنت متأكد أنك تريد الخروج من المجموعات \" ${groupsName} \"؟";

  static String m5(timeString, dateString) => "${dateString} في ${timeString}";

  static String m6(name) => "هل تريد إضافة \'${name}\'؟";

  static String m7(groupName) => "الخروج من مجموعة \"${groupName}\"؟";

  static String m8(count) => "المجموعة • ${count} عضو";

  static String m9(activity) =>
      "هذا الإجراء سيعتمد نشاط \'${activity}\'، مما يجعله مرئيًا لجميع الأعضاء.";

  static String m10(directoryName) =>
      "سيقوم هذا الإجراء بالموافقة على المجلد \'${directoryName}\'، مما يجعله مرئيًا لجميع الأعضاء.";

  static String m11(activity) => "هذا الإجراء سيحذف نشاط \'${activity}\'.";

  static String m12(directoryName) =>
      "سيؤدي هذا الإجراء أيضًا إلى حذف جميع الأنشطة داخل \'${directoryName}\'.";

  static String m13(activity) =>
      "هذا الإجراء سيجعل نشاط \'${activity}\' غير معتمد ومخفي. يمكنك الموافقة عليه مرة أخرى لاحقًا.";

  static String m14(directoryName) =>
      "هذا الإجراء سيجعل المجلد \'${directoryName}\' غير معتمد ومخفي. يمكنك تفعيله مرة أخرى لاحقًا.";

  static String m15(dateString) => "آخر تسجيل دخول ${dateString}";

  static String m16(count) => "الأعضاء: ${count}";

  static String m17(number) => "تم تحديد ${number}";

  static String m18(activityName, userName) =>
      "طلب عضو يدعى \'${userName}\' إضافة نشاط \'${activityName}\' هنا.";

  static String m19(directoryName, userName) =>
      "عضو بإسم \'${userName}\' طلب إضافة المجلد \'${directoryName}\' هنا.";

  static String m20(count) => "عرض الكل (${count} إضافي)";

  static String m21(content) => "ما الإجراء الذي تريده مع هذا \"${content}\"؟";

  static String m22(directoryName) =>
      "ما الإجراء الذي تود اتخاذه مع مجلد \'${directoryName}\'؟";

  static String m23(activityName) =>
      "ما الإجراء الذي تود اتخاذه مع نشاط \'${activityName}\'؟";

  static String m24(timeString) => "أمس في ${timeString}";

  static String m25(activityName) =>
      "لقد قمت بإضافة نشاط \'${activityName}\', لكنه في انتظار موافقة المسئول.";

  static String m26(directoryName) =>
      "لقد أضفت مجلد \'${directoryName}\', لكنه في انتظار موافقة المسئول.";

  static String m27(userName, userEmail) =>
      "أنت على وشك حظر العضو \'${userName}\' الذي يحمل البريد الإلكتروني \'${userEmail}\'. سيمنع هذا الإجراء من إضافة أي شيء إلى الروبوت.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "YouHaveChooseTypeOfAccountPersonalOrBusiness":
            MessageLookupByLibrary.simpleMessage(
                "عليك تحديد ان كان الحساب خاص أو لشركة"),
        "activateVibration":
            MessageLookupByLibrary.simpleMessage("تفعيل الاهتزاز"),
        "addActivity": MessageLookupByLibrary.simpleMessage("إضافة نشاط"),
        "addActivityMessageImageOrFile": MessageLookupByLibrary.simpleMessage(
            "أضف نشاطًا: رسالة، صورة، أو ملف..."),
        "addDirectory": MessageLookupByLibrary.simpleMessage("إضافة مجلد"),
        "addDirectoryName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المجلد"),
        "addFileOrMessage":
            MessageLookupByLibrary.simpleMessage("إضافة ملف أو رسالة"),
        "addMembers": MessageLookupByLibrary.simpleMessage("إضافة أعضاء"),
        "admin": MessageLookupByLibrary.simpleMessage("مسؤول"),
        "areYouSureAboutDeleteYourAccount":
            MessageLookupByLibrary.simpleMessage("هل أنت متأكد من حذف حسابك؟"),
        "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد أنك تريد العودة؟"),
        "atTimeString": m0,
        "back": MessageLookupByLibrary.simpleMessage("رجوع"),
        "blockThisUser":
            MessageLookupByLibrary.simpleMessage("حظر هذا المستخدم"),
        "businessAccount": MessageLookupByLibrary.simpleMessage("حساب الشركة"),
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cantBeLessThan": m1,
        "cantBeMoreThan": m2,
        "changeGroupImage":
            MessageLookupByLibrary.simpleMessage("تغيير صورة المجموعة"),
        "changeGroupName":
            MessageLookupByLibrary.simpleMessage("تغيير اسم المجموعة"),
        "changeName": MessageLookupByLibrary.simpleMessage("تغيير الاسم"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("تغيير كلمة المرور"),
        "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
            "العميل استغرق وقتًا طويلاً في إرسال الطلب. يرجى التحقق من اتصال الشبكة الخاص بك والمحاولة مرة أخرى."),
        "codeVerification":
            MessageLookupByLibrary.simpleMessage("تحقق من الرمز"),
        "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
        "confirmExitGroup": m3,
        "confirmExitGroups": m4,
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
        "dateTimeString": m5,
        "defaultScale": MessageLookupByLibrary.simpleMessage("افتراضي"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteAccount": MessageLookupByLibrary.simpleMessage("حذف الحساب"),
        "deletingYourAccountWillRemoveAllOfYourInformationFromOurDatabase":
            MessageLookupByLibrary.simpleMessage(
                "سيؤدي حذف حسابك إلى إزالة جميع معلوماتك من قاعدة بياناتنا"),
        "deselectAll": MessageLookupByLibrary.simpleMessage("إلغاء تحديد الكل"),
        "deviceMode": MessageLookupByLibrary.simpleMessage("وضع الجهاز"),
        "dismissAsAdmin":
            MessageLookupByLibrary.simpleMessage("إلغاء التصديق كمسؤول"),
        "doNotHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب ؟ "),
        "doYouWantToAddName": m6,
        "docs": MessageLookupByLibrary.simpleMessage("مستندات"),
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
        "enterGroupName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المجموعة"),
        "enterValidEmail":
            MessageLookupByLibrary.simpleMessage("أدخل بريد إلكتروني صالح"),
        "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
            "أدخل بيانات اعتمادك للمتابعة."),
        "error": MessageLookupByLibrary.simpleMessage("خطأ"),
        "errorChangingUserRoleTryAgainLater": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء تغيير دور المستخدم. يرجى المحاولة مرة أخرى لاحقًا."),
        "errorDeletingActivity": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء حذف النشاط من قاعدة البيانات. يرجى المحاولة مرة أخرى لاحقًا."),
        "errorDeletingDirectory": MessageLookupByLibrary.simpleMessage(
            "خطأ في حذف المجلد من قاعدة البيانات. يرجى المحاولة مرة أخرى لاحقًا."),
        "errorInPassword":
            MessageLookupByLibrary.simpleMessage("خطأ في كلمة المرور"),
        "exist": MessageLookupByLibrary.simpleMessage("موجود"),
        "existButClosed":
            MessageLookupByLibrary.simpleMessage("موجود ولكن مغلق"),
        "exitGroup": MessageLookupByLibrary.simpleMessage("الخروج من المجموعة"),
        "exitGroupNameGroup": m7,
        "exitGroups":
            MessageLookupByLibrary.simpleMessage("الخروج من المجموعات"),
        "extraLarge": MessageLookupByLibrary.simpleMessage("كبير جداً"),
        "file": MessageLookupByLibrary.simpleMessage("ملف"),
        "fillField": MessageLookupByLibrary.simpleMessage("املأ هذا الحقل"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "fontSize": MessageLookupByLibrary.simpleMessage("حجم الخط"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("هل نسيت كلمة المرور ؟ "),
        "goBack": MessageLookupByLibrary.simpleMessage("العودة"),
        "goTo": MessageLookupByLibrary.simpleMessage("اذهب الي"),
        "gotIt": MessageLookupByLibrary.simpleMessage("مفهوم"),
        "groupAccessType":
            MessageLookupByLibrary.simpleMessage("نوع الوصول إلى المجموعة"),
        "groupDiscussionType":
            MessageLookupByLibrary.simpleMessage("نوع المحادثة في المجموعة"),
        "groupIsCurrentlyInActive": MessageLookupByLibrary.simpleMessage(
            "هذه المجموعة غير نشطة حاليًا."),
        "groupMembersCount": m8,
        "groupName": MessageLookupByLibrary.simpleMessage("اسم المجموعة..."),
        "groupPermissions":
            MessageLookupByLibrary.simpleMessage("صلاحيات المجموعة"),
        "groupPhoto": MessageLookupByLibrary.simpleMessage("صورة المجموعة"),
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
        "itWillApproveActivity": m9,
        "itWillApproveDirectoryNameDirectory": m10,
        "itWillDeleteActivity": m11,
        "itWillDeleteAllActivitiesInsideDirNameToo": m12,
        "itWillMakeActivityNotApprovedHidden": m13,
        "itWillMarkDirNameAsNotApprovedHidden": m14,
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "large": MessageLookupByLibrary.simpleMessage("كبير"),
        "lastLoginDateString": m15,
        "lastName": MessageLookupByLibrary.simpleMessage("الاسم الأخير"),
        "lightMode": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "markAsUnRead":
            MessageLookupByLibrary.simpleMessage("وضع علامة كغير مقروء"),
        "media": MessageLookupByLibrary.simpleMessage("وسائط"),
        "mediaAndDocs": MessageLookupByLibrary.simpleMessage("وسائط ومستندات"),
        "membersCount": m16,
        "menu": MessageLookupByLibrary.simpleMessage("القائمة"),
        "muteNotification":
            MessageLookupByLibrary.simpleMessage("كتم الإشعارات"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "nameChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تغيير الاسم بنجاح"),
        "newGroup": MessageLookupByLibrary.simpleMessage("مجموعة جديدة"),
        "newPassword": MessageLookupByLibrary.simpleMessage("كلمة مرور جديدة"),
        "noAccountFoundMatchingThisQuery": MessageLookupByLibrary.simpleMessage(
            "لم يتم العثور على حساب يطابق هذا الاستعلام."),
        "noCodeReceived":
            MessageLookupByLibrary.simpleMessage("لم يتم استلام رمز؟ "),
        "noInternetConnection":
            MessageLookupByLibrary.simpleMessage("لا يوجد اتصال بالإنترنت"),
        "noNeed": MessageLookupByLibrary.simpleMessage("لا تحتاج للمساعدة؟ "),
        "notExist": MessageLookupByLibrary.simpleMessage("غير موجود"),
        "notSamePass":
            MessageLookupByLibrary.simpleMessage("ليست نفس كلمة المرور"),
        "notification": MessageLookupByLibrary.simpleMessage("الإشعارات"),
        "oR": MessageLookupByLibrary.simpleMessage("أو"),
        "onLockScreen": MessageLookupByLibrary.simpleMessage("على شاشة القفل"),
        "onlyAdminsCanAddNewData": MessageLookupByLibrary.simpleMessage(
            "يُسمح فقط للمسؤولين بإضافة بيانات جديدة."),
        "onlyGroupAdminsWillKnow": MessageLookupByLibrary.simpleMessage(
            "فقط سيعرف مسؤولو المجموعة أنك غادرت المجموعة."),
        "openCamera": MessageLookupByLibrary.simpleMessage("فتح الكاميرا"),
        "openFiles": MessageLookupByLibrary.simpleMessage("فتح الملفات"),
        "openGallery": MessageLookupByLibrary.simpleMessage("فتح المعرض"),
        "orConnectUsing": MessageLookupByLibrary.simpleMessage(
            "أو قم بتسجيل الدخول باستخدام"),
        "owner": MessageLookupByLibrary.simpleMessage("المالك"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "personalAccount": MessageLookupByLibrary.simpleMessage("حساب خاص"),
        "photo": MessageLookupByLibrary.simpleMessage("صورة"),
        "popUps": MessageLookupByLibrary.simpleMessage("النوافذ المنبثقة"),
        "pressAgainToExit":
            MessageLookupByLibrary.simpleMessage("اضغط مرة أخرى للخروج"),
        "privacyAndSecurity":
            MessageLookupByLibrary.simpleMessage("الخصوصية والأمان"),
        "processHasBeenCancelled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء العملية"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "promoteGroupAdmin":
            MessageLookupByLibrary.simpleMessage("ترقية إلى مسؤول"),
        "reTypeNewPassword": MessageLookupByLibrary.simpleMessage(
            "أعد كتابة كلمة المرور الجديدة"),
        "readOnly": MessageLookupByLibrary.simpleMessage("فقط قراءة"),
        "readWrite": MessageLookupByLibrary.simpleMessage("قراءة وكتابة"),
        "readWriteWithAdminAgreements": MessageLookupByLibrary.simpleMessage(
            "قراءة وإضافة مع موافقة المسؤول"),
        "recover": MessageLookupByLibrary.simpleMessage("استعادة"),
        "recoverYourAccount":
            MessageLookupByLibrary.simpleMessage("استعادة حسابك"),
        "rememberMe": MessageLookupByLibrary.simpleMessage("تذكرني"),
        "remove": MessageLookupByLibrary.simpleMessage("إزالة"),
        "resend": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "searchHere": MessageLookupByLibrary.simpleMessage("ابحث هنا..."),
        "selectAll": MessageLookupByLibrary.simpleMessage("تحديد الكل"),
        "selectedWithNumber": m17,
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
        "uCanNtBlockAdmins":
            MessageLookupByLibrary.simpleMessage("لا يمكنك حظر المسؤولين."),
        "uCanNtChangeRoleOfTheOwnerOfGroup":
            MessageLookupByLibrary.simpleMessage(
                "لا يمكنك تغيير دور مالك المجموعة."),
        "uCanNtRemoveOwnerOfGroup": MessageLookupByLibrary.simpleMessage(
            "لا يمكنك إزالة مالك المجموعة."),
        "uHaveToVerifyAccountFirst":
            MessageLookupByLibrary.simpleMessage("يجب التحقق من حسابك أولاً"),
        "unBlockThisUser":
            MessageLookupByLibrary.simpleMessage("إلغاء حظر هذا المستخدم"),
        "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ غير معروف. يرجى المحاولة مرة أخرى في وقت لاحق أو الاتصال بالدعم للمساعدة."),
        "unmuteNotification":
            MessageLookupByLibrary.simpleMessage("تفعيل الإشعارات"),
        "userIsNotActivePleaseContactSupportForFurtherAssistance":
            MessageLookupByLibrary.simpleMessage(
                "المستخدم غير نشط. يرجى الاتصال بالدعم للمساعدة الإضافية."),
        "userNoPermission": MessageLookupByLibrary.simpleMessage(
            "المستخدم ليس لديه الإذن لأداء هذا الإجراء."),
        "userNotEmailPasswordToNewPass": MessageLookupByLibrary.simpleMessage(
            "المستخدم ليس عبارة عن حساب بالبريد الإلكتروني وكلمة مرور لتغيير كلمة المرور"),
        "userNotEmailPasswordToSendVerificationCode":
            MessageLookupByLibrary.simpleMessage(
                "هذا المستخدم ليس مزودًا ببريد إلكتروني وكلمة مرور لإرسال رمز التحقق."),
        "userNotFound": MessageLookupByLibrary.simpleMessage(
            "لا يوجد مستخدم لهذا البريد الإلكتروني."),
        "userWantToAddActivity": m18,
        "userWantToAddDirectory": m19,
        "verify": MessageLookupByLibrary.simpleMessage("التحقق"),
        "verifyIt": MessageLookupByLibrary.simpleMessage("تحقق منه"),
        "viewAllCountMore": m20,
        "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور المقدمة ضعيفة جدًا."),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("مرحبًا بعودتك!"),
        "whatActionWithContent": m21,
        "whatDoYouWantToDoWithDirNameDirectory": m22,
        "whatDoYouWantToDoWithThisActivity": m23,
        "wrongPassword": MessageLookupByLibrary.simpleMessage(
            "تم تقديم كلمة مرور خاطئة لهذا المستخدم."),
        "yesterday": MessageLookupByLibrary.simpleMessage("أمس"),
        "yesterdayAtTimeString": m24,
        "you": MessageLookupByLibrary.simpleMessage("أنت"),
        "youAddedActivityName": m25,
        "youAddedDirNameDirectory": m26,
        "youAreAboutToBlockMember": m27,
        "youCanMakeNewGroups": MessageLookupByLibrary.simpleMessage(
            "بإمكانك إنشاء مجموعات جديدة بحرية."),
        "youCanNotUseSamePreviousPassword":
            MessageLookupByLibrary.simpleMessage(
                "لا يمكنك استخدام نفس كلمة المرور السابقة."),
        "youCanNowAddAnything": MessageLookupByLibrary.simpleMessage(
            "أصبح بإمكانك الآن إضافة أي شيء."),
        "youHaveToConfirmYourAccount":
            MessageLookupByLibrary.simpleMessage("يجب تأكيد حسابك"),
        "youWithColon": MessageLookupByLibrary.simpleMessage("أنت: "),
        "yourDataWillBeAwaitingApproval": MessageLookupByLibrary.simpleMessage(
            "ستكون بياناتك في انتظار الموافقة من المسئول."),
        "yourGroups": MessageLookupByLibrary.simpleMessage("مجموعاتك"),
        "yourNewPasswordMustBeDifferentFromPreviously":
            MessageLookupByLibrary.simpleMessage(
                "يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة سابقًا"),
        "yourRequestNotFoundTryAgainLater":
            MessageLookupByLibrary.simpleMessage(
                "لم يتم العثور على طلبك. حاول مرة أخرى لاحقًا.")
      };
}
