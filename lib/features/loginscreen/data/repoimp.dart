
import 'package:flutter/material.dart';

import 'package:silent/core/styels.dart';
import 'package:silent/features/loginscreen/data/repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silent/features/loginscreen/presention/view/singup.dart';
class Singuprepoimp extends Singuprepo {
  @override

void createUserAndSendVerificationCode(email, pass) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass);

    // Send email verification
     User user = userCredential.user!;
     await user.sendEmailVerification();

    // print('Verification email sent');
  } catch (e) {
    String errorMessage = 'خطا ف انشاء الحساب ';

    // Check the type of exception and customize the error message
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'الايميل الذي ادخلته مستخدم بالفعل' ;
          break;
        case 'invalid-email':
          errorMessage = 'الايميل الذي ادخلته غير صحيح.';
          break;
        case 'weak-password':
          errorMessage = 'كلمه السر ضعيفه';
          break;
        // Add more cases as needed for different error codes
      }
    }

    print('$errorMessage: $e');

    // Display the error message to the user
    final snackBar = SnackBar(content: Text(errorMessage,style: styels.font12,),backgroundColor: Color(0xFF3B26B8),shape: Border.all(),);
    ScaffoldMessenger.of(cx).showSnackBar(snackBar);
  }
}
}
