import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';

import '../../../../constant.dart';
import '../../../loginscreen/presention/view/widget/customtextformfiled.dart';

class Account extends StatelessWidget { 
   @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: bodyaccount(),
  );
  }
}
class bodyaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
       children: [
      Text("الحساب ",style: styels.font20.copyWith(color: Colors.black87,fontSize: 26),),
     const SizedBox(
      height: 50,
      width: 100,
      child: CircleAvatar()),
      
       
       Textformfiledyou(onSaved: (S ) {  }, str1: 'الاسم', str2: 'احمد اسامه',),
       Textformfiledyou(onSaved: (S ) {  }, str1: 'البريدالالكتروني', str2: 'ahmed@gmail.com',),
        Textformfiledyou(onSaved: (S ) {  }, str1: 'كلمه السر', str2: '**************',),
        update(onPressed: (){}, str: "تعديل البيانات",)
    
       ],
    
      ),
    );
  }
}
class update extends StatelessWidget{
  const update({super.key,required this.onPressed, required this.str});
 final void Function()? onPressed;
 final String str;
  @override
  Widget build(BuildContext context) {
   return TextButton(onPressed: onPressed,style: ButtonStyle(
    fixedSize: MaterialStateProperty.all(const Size(380,55)),
      foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3B26B8)), // Text color
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Background color
      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize:15 ,fontFamily: fontfamily)), // Text style
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13)), // Padding
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Border radius
          side:const BorderSide(color: const Color(0xFF3B26B8)), // Border color
        ),
        
      ),
    ), child: Text(str),
  );
  }

}
