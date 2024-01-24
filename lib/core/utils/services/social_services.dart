import 'dart:developer';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class SocialServices {
  const SocialServices();

  // * google sign in
  Future<AuthUserEntity?> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) return null;

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);

    log('sign in with google :${user.user}');
    if (user.user == null) return null;
    return AuthUserEntity.fromFirebaseAuth(user.user!);
  }

  // * face sign in
  Future<AuthUserEntity?> signInWithFacebook() async {
    // final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // if (gUser == null) return null;

    // final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // final OAuthCredential credential =
    //     GoogleAuthProvider.credential(
    //   accessToken: gAuth.accessToken,
    //   idToken: gAuth.idToken,
    // );

    // UserCredential user =
    //     await FirebaseAuth.instance.signInWithCredential(credential);

    // log(user.user.toString());
    // if (user.user == null) return null;
    // return AuthUserEntity.fromFirebaseAuth(user.user!);
  }
}
