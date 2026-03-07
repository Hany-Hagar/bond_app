import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SocialMediaAuthService {
  GoogleSignIn? _googleSignIn;
  FacebookAuth? _facebookAuth;
  SocialMediaAuthService();

  GoogleSignIn get _google {
    _googleSignIn ??= GoogleSignIn(
      scopes: ['email', 'profile'],
      serverClientId:
          "683115311934-pskmqh37t2u8mm3qvq7da57vdcnq21ph.apps.googleusercontent.com",
    );
    return _googleSignIn!;
  }

  FacebookAuth get _facebook {
    _facebookAuth ??= FacebookAuth.instance;
    return _facebookAuth!;
  }

  Future<void> signInWithGoogle() async {
    try {
      final account = await _google.signIn();

      if (account == null) {
        log("User cancelled Google Sign-In");
        return;
      }

      final auth = await account.authentication;

      log("GOOGLE USER DATA READY");
      log("idToken: ${auth.idToken}");
      log("Email: ${account.email}");
      log("Name: ${account.displayName}");
      log("Photo URL: ${account.photoUrl}");
      
    } catch (e) {
      log("Google Sign-In error: $e");
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await _facebook.login(
        permissions: ['public_profile', 'email'],
      );

      if (result.status == LoginStatus.success) {
        // Retrieve user data
        final userData = await _facebook.getUserData();

        log("FACEBOOK USER DATA READY");
        log("User Data: $userData");
        log("Access Token: ${result.accessToken!.tokenString}");
      } else {
        log("Facebook Login failed: ${result.message}");
        log("Status: ${result.status}");
      }
    } catch (e) {
      log("Facebook Sign-In error: $e");
    }
  }

  // Global Sign-Out
  Future<void> signOut() async {
    try {
      await _google.signOut();
      await _facebook.logOut();
      log("Signed out from Google and Facebook");
    } catch (e) {
      log("Error during sign out: $e");
    }
  }
}
