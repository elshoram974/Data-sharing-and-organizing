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
  static const String getGroups = '$_home/getGroups.php';

  // * user profile
  // static const String _profile = '$_baseLink/profile';
}
