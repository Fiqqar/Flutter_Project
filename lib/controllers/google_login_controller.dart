import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan1_11pplg2/routes/routes.dart';

class GoogleLoginController extends GetxController {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  var isLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('google_uid', userCredential.user!.uid);
      await prefs.setString('name', userCredential.user!.displayName ?? '');
      await prefs.setString('email', userCredential.user!.email ?? '');
      await prefs.setString('photoUrl', userCredential.user!.photoURL ?? '');

      Get.offAllNamed(AppRoutes.mainMenu);
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
