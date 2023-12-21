import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';

import 'package:silent/core/styels.dart';

import 'package:silent/features/loginscreen/presention/view/widget/loginbody.dart';
var log;
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   log=context;
   return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: Colors.white,
        title: Image.asset("asset/image/لولو.png"),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("هل لديك حساب؟",style: styels.font16.copyWith(color: Colors.black),),
              GestureDetector(
                onTap: ()=> GoRouter.of(context).push(router.kSingupview),
                child: Text("اشترك الان",style: styels.font16.copyWith(color: const Color.fromARGB(190, 151, 71, 255)),)),
              Image.asset("asset/image/imoge.png")
            ],
          ),
        )],
      ),
    body:  Loginbody(),
   );
  }

}

