import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

// ignore: must_be_immutable
class Textformfiledyou extends StatelessWidget {
   Textformfiledyou({super.key, required this.str1, required this.str2,required this.onSaved});
final String str1,str2;
void Function(String?)? onSaved;
final GlobalKey<FormState> globalKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135, // ارتفاع الحاوية الكلية
      width: 358,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            str1, // النص الثابت
            style: const TextStyle(
              fontSize: 16,
              fontFamily: fontfamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5), // تباعد بين النص الثابت وحقل النص
          TextFormField(
          onChanged:onSaved ,  
   validator: (value) {
     
     if(value!.isEmpty)
     {
return "هذا الحقل مطلوب ";
     }
     return null;
   },
            decoration: InputDecoration(
              fillColor: const Color(0x29808080),
              filled: true,
              hintText: str2,
              hintStyle: const TextStyle(color: Color(0x4D000000)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color:Color(0xFF3B26B8) )
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0x29808080))
              )
            ),
          ),
        ],
      ),
    );
  }
}