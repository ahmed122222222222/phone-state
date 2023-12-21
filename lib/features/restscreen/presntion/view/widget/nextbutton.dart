import 'package:flutter/material.dart';

import '../../../../../constant.dart';
class nextbuttom extends StatelessWidget{
  const nextbuttom({super.key,required this.onPressed, required this.str});
 final void Function()? onPressed;
 final String str;
  @override
  Widget build(BuildContext context) {
   return TextButton(onPressed: onPressed,style: ButtonStyle(
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
    ), child: Text(str),
  );
  }

}
