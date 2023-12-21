import 'package:flutter/material.dart';

import '../../../../../constant.dart';
class custombutton extends StatelessWidget{
  const custombutton({super.key,required this.onPressed});
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
   return TextButton(onPressed: onPressed, child:const Text("تسجيل الدخول"),style: ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(380,55)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3B26B8)), // Background color
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize:15 ,fontFamily: fontfamily)), // Text style
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13)), // Padding
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Border radius
          side:const BorderSide(color: Color.fromARGB(23, 15, 72, 166)), // Border color
        ),
        
      ),
    ),
  );
  }

}
