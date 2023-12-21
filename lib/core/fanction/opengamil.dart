   import 'package:url_launcher/url_launcher.dart';

openGmailInbox() async {
    
       final url = 'https://mail.google.com/mail/u/0/#inbox';
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
     
      

    } else {
      // ignore: avoid_print
      print("object");
    }
    }