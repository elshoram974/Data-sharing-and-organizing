import 'dart:developer';

import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class SocialServices {
  const SocialServices();

  // * google sign in
  Future<AuthUserEntity?> signInWithGoogle() async {
    late final UserCredential? user;
    if (AppConst.isWeb) {
      user = await _getGoogleUserInWeb();
    } else {
      user = await _getGoogleUserInAndroid();
    }

    log('sign in with google : ${user?.user}');
    return _convertToAuthEntity(user);
  }

  Future<UserCredential?> _getGoogleUserInWeb() {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    return FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  Future<UserCredential?> _getGoogleUserInAndroid() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) return null;

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // ------------------------------------------

  // * face sign in
  Future<AuthUserEntity?> signInWithFacebook() async {
    late final UserCredential? user;
    if (AppConst.isWeb) {
      user = await _getFacebookUserInWeb();
    } else {
      user = await _getFacebookUserInAndroid();
    }

    log('sign in with facebook : ${user?.user}');

    return _convertToAuthEntity(user);
  }

  Future<UserCredential?> _getFacebookUserInWeb() async {
    final FacebookAuthProvider facebookProvider = FacebookAuthProvider();

    facebookProvider.addScope('email');
    facebookProvider.setCustomParameters({
      'display': 'popup',
    });

    return await FirebaseAuth.instance.signInWithPopup(facebookProvider);
  }

  Future<UserCredential?> _getFacebookUserInAndroid() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status != LoginStatus.success) return null;

    final OAuthCredential credential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // -----------------------------------------------

  AuthUserEntity? _convertToAuthEntity(UserCredential? user) {
    if (user?.user == null) return null;

    final AuthUserEntity auth = AuthUserEntity.fromFirebaseAuth(user!.user!);

    if (user.user!.email == null) return auth.copyWith(email: user.user!.uid);

    return auth;
  }
}
