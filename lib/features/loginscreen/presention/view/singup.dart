import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';

import 'package:silent/core/styels.dart';
import 'package:silent/features/loginscreen/presention/view/widget/singeupbody.dart';

// ignore: prefer_typing_uninitialized_variables
var cx;
class Signup extends StatelessWidget {
  const Signup({super.key});

 
  @override

  Widget build(BuildContext context) {
cx=context;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset("asset/image/لولو.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "هل لديك حساب؟",
                  style: styels.font16.copyWith(color: Colors.black),
                ),
                GestureDetector(
                  onTap: ()=> GoRouter.of(context).push(router.kloginview),
                  child: Text(
                    "سجل دخولك ",
                    style: styels.font16
                        .copyWith(color: const Color.fromARGB(190, 151, 71, 255)),
                  ),
                ),
                Image.asset("asset/image/imoge.png")
              ],
            ),
          )
        ],
      ),
      body: Singupbody(),
    );
  }
}

