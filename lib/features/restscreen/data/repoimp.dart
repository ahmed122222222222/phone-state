import 'package:firebase_auth/firebase_auth.dart';
import 'package:silent/features/restscreen/data/repo.dart';

class sendimp extends sendrepo {
  @override
  Future<void> sendrestpass(email) async {
    try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  } catch (e) {
    print("An error occurred: $e");
    
  }
  }

}
