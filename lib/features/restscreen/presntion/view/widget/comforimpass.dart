// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';
import 'package:silent/core/styels.dart';

import '../../../../../core/fanction/opengamil.dart';
import '../../../../loginscreen/data/repoimp.dart';
import 'nextbutton.dart';

// ignore: must_be_immutable
class ConfirmScreen extends StatelessWidget {
  Singuprepoimp singuprepoimp=Singuprepoimp();

  ConfirmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: [
         const SizedBox(height:50,),
           SizedBox(
            height: 100,
            child: Image.asset("asset/image/lolo.png"))
           , 
          const SizedBox(height: 20,),
           const Text(
              ' لقد ارسلنا رساله اليك',
              style: styels.font30,
              
            ),
             Text(
              'راجع حسابك',
              style: styels.font20.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.all(8.0),
            
             child: nextbuttom(onPressed: () async {
             
 openGmailInbox();
 await  Future.delayed(const Duration(seconds: 3));
   // ignore: use_build_context_synchronously
   GoRouter.of(context).push(router.kloginview);
 

 

            }, str: 'افتح الجميل',)
          ),
        ],
      );
  }
}