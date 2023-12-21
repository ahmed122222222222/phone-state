import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/loginscreen/data/Loginrepo.dart';
import 'package:silent/features/loginscreen/presention/view/login.dart';

class Loginimp extends Loginrepo {
  @override
  Future<void> login(email, pass) async {
  try {
  // ignore: unused_local_variable
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
} on Exception catch (e) {
   String errorMessage = 'Error signing in';

    // Check the type of exception and customize the error message
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'الايميل غير صالح.';
          break;
        case 'user-disabled':
          errorMessage = 'الايميل معطل يرجي التواصل ع الرقم 01098636639.';
          break;
        case 'user-not-found':
          errorMessage = 'الايميل غير مرتيط بحساب.';
          break;
        case 'wrong-password':
          errorMessage = 'كلمه السر خاطئه ';
          break;
        // Add more cases as needed for different error codes
      }
    }

    print('$errorMessage: $e');

    // Display the error message to the user
    final snackBar = SnackBar(content: Text(errorMessage,style: styels.font12 ,),backgroundColor: Color(0xFF3B26B8),);
    ScaffoldMessenger.of(log).showSnackBar(snackBar);
  }
}
  
  }

