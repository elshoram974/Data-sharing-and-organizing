abstract final class AppLinks {
  const AppLinks();

  static const String appLink = '';

  static const String _baseLink = 'https://thiet.mrecode.com/api';

  // * authorization links
  static const String _auth = '$_baseLink/auth/users';
  static const String login = '$_auth/login_user.php';
  static const String signUp = '$_auth/sign_up_user.php';
}
