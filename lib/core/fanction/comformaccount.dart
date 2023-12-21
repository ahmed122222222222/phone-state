import 'package:firebase_auth/firebase_auth.dart';

Future<bool> verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }
  