
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/presention/view/homeview.dart';
import 'package:silent/features/loginscreen/presention/manager/login/login_cubit.dart';

import '../../../../../constant.dart';
import '../../../../../core/fanction/comformaccount.dart';
import '../../../../homepage/presention/view/widget/buttonbackground.dart';
import '../../../../homepage/presention/view/widget/strokbutton.dart';
import 'customtextformfiled.dart';

// ignore: must_be_immutable
class Loginbody extends StatelessWidget {
 
  final GlobalKey<FormState> globalKey = GlobalKey();
  // ignore: prefer_typing_uninitialized_variables
  var  email, pass;

  Loginbody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 90,
          right: 51,
          top: 80,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: globalKey,
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "مرحبا بك في ",
                  style: styels.font40.copyWith(
                      fontWeight: FontWeight.w800,
                      fontFamily: "irish",
                      fontSize: 36),
                ),
                Image.asset("asset/image/لولو.png"),
              ],
            ),
            Text(
              "نهتم لمكالمتك المهمه سوف ",
              style:
                  styels.font20.copyWith(color: Colors.black38, fontSize: 18),
            ),
            Text(
              "نساعدك علي تفادي الازعاج",
              style:
                  styels.font20.copyWith(color: Colors.black38, fontSize: 18),
            ),
            const SizedBox(
              height: 25,
            ),
            Textformfiledyou(
              str1: 'البريد الالكتروني',
              str2: 'ahmedosama@gmail.com',
              onSaved: (v) {
                email = v;
              },
            ),
            Textformfiledyou(
              str1: "كلمه السر",
              str2: "***********",
              onSaved: (v) {
                pass = v;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {

                return custombutton(onPressed: () async {
                 if (globalKey.currentState!.validate()) {
                      // تحقق من صحة الحقول قبل استدعاء دالة تسجيل الدخول
                    
                      bool isEmailVerified = await verifyEmail();

              if (isEmailVerified) {
              // ignore: use_build_context_synchronously
              BlocProvider.of<LoginCubit>(context).Singin(email, pass);
              // ignore: use_build_context_synchronously
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeView()));
              } 
              else {
                const snackBar = SnackBar(
                  content:
                      Text('الرجاء تأكيد البريد الإلكتروني', style: styels.font12),
                  backgroundColor: Color(0xFF3B26B8),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
                      
                    } else {
                      const snackBar =
                          SnackBar(content: Text('الرجاء إدخال البريد الإلكتروني وكلمة المرور.',style: styels.font12,),backgroundColor: Color(0xFF3B26B8),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
                child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(router.ksendview),
                    child: const Text(
                      "هل نسيت كلمه السر ؟",
                      style: TextStyle(fontSize: 20, fontFamily: fontfamily),
                    ))),
            const SizedBox(
              height: 25,
            ),
            Strokbutton(onPressed: () {
              GoRouter.of(context).push(router.kSingupview);
            })
          ],
        ),
      ),
    );
  }
}
