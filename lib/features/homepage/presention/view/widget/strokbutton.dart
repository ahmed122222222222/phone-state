import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class Strokbutton extends StatelessWidget{
  const Strokbutton({super.key,required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
   return TextButton(onPressed: onPressed,style: ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(380,45)),
      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3B26B8)), // Text color
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent), // Background color
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize:15 ,fontFamily: fontfamily)), // Text style
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13)), // Padding
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Border radius
          side: const BorderSide(color: Color(0xFF3B26B8)), // Border color
        ),
        
      ),
    ), child: const Text("انشاء حساب"),
  );
  }

}