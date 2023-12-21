import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/loginscreen/presention/view/widget/comforimscreen.dart';
import '../../../../../core/fanction/opengamil.dart';

import '../../../../restscreen/presntion/view/widget/nextbutton.dart';

  // ignore: prefer_typing_uninitialized_variables
  var conx;
  class Vaildabbody  extends StatelessWidget{
  const Vaildabbody({super.key});

  @override

  Widget build(BuildContext context) {
   conx=context;
   return ListView(
      children: [
        const SizedBox(height: 90,),
        SizedBox(
          height: 86,
          width: 100,
          child: Image.asset("asset/image/lolo.png")),
        const Padding(
          padding: EdgeInsets.only(top:55,left: 60,right: 37,),
          child: Text("   تاكيد الحساب ",style:styels.font30 ,),
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
         padding: const EdgeInsets.symmetric(horizontal:37.0),
         child: nextbuttom(onPressed: () async{
         openGmailInbox();
       await  Future.delayed(const Duration(seconds: 5));
          // ignore: use_build_context_synchronously
          showModalBottomSheet(
            shape:Border.all(),
            context: context, builder: (context){
            return const ConfirmSingupScreen();
          });
         }, str: 'ارسال ',),
       )
      ],
    );
  }

  }
