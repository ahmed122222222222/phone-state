
import 'package:flutter/material.dart';


import 'package:silent/core/styels.dart';

import 'package:silent/features/restscreen/presntion/view/widget/restbody.dart';


class Semf extends StatefulWidget {
  const Semf({super.key});


  @override
  State<Semf> createState() => _SemfState();
}

class _SemfState extends State<Semf> {
  @override
  Widget build(BuildContext context) {
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
              Text("اشترك الان",style: styels.font16.copyWith(color: const Color.fromARGB(190, 151, 71, 255)),),
              Image.asset("asset/image/imoge.png")
            ],
          ),
        )],
      ),
      body: Sendbody(),
    );
  }
}







