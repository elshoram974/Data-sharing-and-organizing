abstract final class AppLinks {
  const AppLinks();

  static const String appLink = 'https://sharikna.mrecode.com';

  static const String _baseLink = 'https://thiet.mrecode.com/api';
  static const String _userLink = '$_baseLink/user';

  static const String sendNotification = 'https://fcm.googleapis.com/fcm/send';

  // * authorization links
  static const String _auth = '$_userLink/auth';
  static const String login = '$_auth/login_user.php';
  static const String loginByProvider = '$_auth/login_provider.php';
  static const String signUp = '$_auth/sign_up_user.php';
  static const String sendVerifyCode = '$_auth/send_verify_code.php';
  static const String checkVerifyCode = '$_auth/check_verify_code.php';
  static const String newPassword = '$_auth/new_password.php';

  // * user home
  static const String _home = '$_userLink/home';
  static const String userHome = '$_home/home.php';
  static const String getDirectoriesInside =
      '$_home/directions_and_activities.php';

  // * group
  static String askAI = 'http://127.0.0.1:5000/api/chatbot';

  // * bot & chat
  static const String _botChatChanges = '$_changes/bot&chat';
  static const String addNewDir = '$_botChatChanges/adddirection.php';
  static const String approveActivity = '$_botChatChanges/approvedactivity.php';
  static const String deleteActivity = '$_botChatChanges/deleteactivity.php';
  static const String blockUserGroup = '$_botChatChanges/blockuser.php';
  static const String approveDirectory =
      '$_botChatChanges/approveddirection.php';
  static const String deleteDirectory = '$_botChatChanges/deletedirection.php';
  static const String addNewActivity = '$_botChatChanges/addactivity.php';
  static const String groupMembers = '$_botChatChanges/group_members.php';
  static const String searchUsers = '$_botChatChanges/search_users.php';
  static const String addMember = '$_botChatChanges/add_member.php';
  static const String blockUserDirectly =
      '$_botChatChanges/blockuser_directly.php';
  static const String changeAdmin = '$_botChatChanges/promate_member.php';
  static const String removeMember = '$_botChatChanges/remove_member.php';
  static const String memberNotification =
      '$_botChatChanges/member_notification.php';
  static const String editGroupPermissions =
      '$_botChatChanges/group_permissions.php';
  static const String editGroupData = '$_botChatChanges/edit_group.php';
  static const String removeGroupImage =
      '$_botChatChanges/remove_group_image.php';
  static const String makeNewGroup = '$_botChatChanges/addgroup.php';

  // * user profile
  static const String _changes = '$_userLink/changes';
  static const String changeName = '$_changes/changename.php';
  static const String changePassword = '$_changes/changepassword.php';
  static const String deleteUser = '$_changes/deleteuser.php';
  static const String changeUserImage = '$_changes/changephoto.php';
  static const String deleteUserImage = '$_changes/deletephoto.php';
  static const String removeGroups =
      '$_changes/delete_user_from_some_groups.php';
}
