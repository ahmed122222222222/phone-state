import 'package:flutter/material.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/presention/view/homeview.dart';
import '../../../../../core/fanction/comformaccount.dart';
import '../../../../restscreen/presntion/view/widget/nextbutton.dart';
 class ConfirmSingupScreen  extends StatelessWidget{
  const ConfirmSingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
return    ListView(
        children: [
         const SizedBox(height:50,),
           SizedBox(
            height: 100,
            child: Image.asset("asset/image/lolo.png"))
           , 
          const SizedBox(height: 20,),
           const Text(
              '    لو تم التفعيل اضغط التالي',
              style: styels.font30,
              
            ),
             Text(
              '   راجع حسابك ان لم تفعل',
              style: styels.font20.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.all(8.0),
            
             child: nextbuttom(onPressed:() async {
              bool isEmailVerified = await verifyEmail();
              if (isEmailVerified) {
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeView()));
              } else {
                const snackBar = SnackBar(
                  content:
                      Text('الرجاء تأكيد البريد الإلكتروني', style: styels.font12),
                  backgroundColor: Color(0xFF3B26B8),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, str: ' التالي',)
          ),
        ],
      );
  }
 }