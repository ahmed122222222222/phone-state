// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';

import '../../../data/repoimp.dart';

import 'comforimpass.dart';
import 'customtextformfiled.dart';
import 'nextbutton.dart';

// ignore: must_be_immutable
class Sendbody extends StatelessWidget{
  // ignore: prefer_typing_uninitialized_variables
  var pass;
  sendimp sendr =sendimp();

  Sendbody({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 90,),
        SizedBox(
          height: 86,
          width: 100,
          child: Image.asset("asset/image/lolo.png")),
        const Padding(
          padding: EdgeInsets.only(top:55,left: 60,right: 37,),
          child: Text("اعاده تعين كلمه السر ",style:styels.font30 ,),
        ),
        Padding(
          padding: const EdgeInsets.only(left:60,right: 70),
          child: Text("سوف نرسل لك رساله ع الايميل ",style: styels.font16.copyWith(color: Colors.black45),),
        ),
        Padding(
          padding: const EdgeInsets.only(left:60,right: 70,bottom: 65),
          child: Text("راجع الايميل الخاص بك ",style: styels.font16.copyWith(color: Colors.black45),),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:40.0),
        child: Textformfiledrest(str1: "البريد الابكتروني", str2: "ahmedosama@gmail.com", onSaved: (vc)=>pass=vc),
      ) ,
       Padding(
         padding: const EdgeInsets.symmetric(horizontal:37.0),
         child: nextbuttom(onPressed: (){
          sendr.sendrestpass(pass);
          showModalBottomSheet(
            shape:Border.all(),
            context: context, builder: (context){
            return ConfirmScreen();
          });
         }, str: 'ارسال ',),
       )
      ],
    );
  }

}