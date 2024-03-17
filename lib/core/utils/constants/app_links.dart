abstract final class AppLinks {
  const AppLinks();

  static const String appLink = 'https://sharikna.mrecode.com';

  static const String _baseLink = 'https://thiet.mrecode.com/api/user';

  // * authorization links
  static const String _auth = '$_baseLink/auth';
  static const String login = '$_auth/login_user.php';
  static const String loginByProvider = '$_auth/login_provider.php';
  static const String signUp = '$_auth/sign_up_user.php';
  static const String sendVerifyCode = '$_auth/send_verify_code.php';
  static const String checkVerifyCode = '$_auth/check_verify_code.php';
  static const String newPassword = '$_auth/new_password.php';

  // * user home
  static const String _home = '$_baseLink/home';
  static const String userHome = '$_home/home.php';
  static const String removeGroups = '$_home/removeGroups.php';

  // * user profile
  static const String _changes = '$_baseLink/changes';
  static const String changeName = '$_changes/changename.php';
  static const String changePassword = '$_changes/changepassword.php';
  static const String deleteUser = '$_changes/deleteuser.php';
  static const String changeUserImage = '$_changes/changeImage.php';
  static const String deleteUserImage = '$_changes/deleteUserImage.php';
}
