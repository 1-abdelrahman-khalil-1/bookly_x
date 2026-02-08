// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Future<String?> signInWithGoogle() async {
//   final googleSignIn = GoogleSignIn(
//     scopes: [
//       'https://www.googleapis.com/auth/userinfo.email',
//       'https://www.googleapis.com/auth/userinfo.profile'
//     ],
//   );

//   final googleUser = await googleSignIn.signIn();
//   if (googleUser == null) return null;

//   final googleAuth = await googleUser.authentication;

//   return googleAuth.idToken;
// }

// Future<String?> signInWithApple() async {
//   final appleCredential = await SignInWithApple.getAppleIDCredential(
//     scopes: [
//       AppleIDAuthorizationScopes.email,
//       AppleIDAuthorizationScopes.fullName,
//     ],
//   );

//   final oauthCredential = OAuthProvider("apple.com").credential(
//     idToken: appleCredential.identityToken,
//     accessToken: appleCredential.authorizationCode,
//   );

//   final userCredential =
//       await FirebaseAuth.instance.signInWithCredential(oauthCredential);

//   final idToken = await userCredential.user?.getIdToken();

//   return idToken;
// }
