import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';

import 'package:silent/core/styels.dart';
import 'package:silent/features/homepage/presention/view/widget/buttonbackground.dart';
import 'package:silent/features/homepage/presention/view/widget/strokbutton.dart';

class Home extends StatelessWidget{
  const Home({super.key});

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
              Text("اشترك الان",style: styels.font16.copyWith(color: Color.fromARGB(190, 151, 71, 255)),),
              Image.asset("asset/image/imoge.png")
            ],
          ),
        )],
      ),
      body: HomeBody(),
    );
  }

}
class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(left: 90
     ,right: 51,top: 153),
     child: ListView(
      children: [
        Row(
          children: [
            Text("مرحبا بك في ",style: styels.font40.copyWith(fontWeight: FontWeight.w800,fontFamily: "irish",fontSize: 36),),
            Image.asset("asset/image/لولو.png"),
          ],
          
        ),
        Text("نهتم لمكالمتك المهمه سوف ",style: styels.font20.copyWith(color: Colors.black38),),
        Text("نساعدك علي تفادي الازعاج",style: styels.font20.copyWith(color: Colors.black38),),
       Padding(
          padding:  const EdgeInsets.only(top:57,bottom: 25),
          child: custombutton(onPressed: () {   GoRouter.of(context).push(router.kloginview);},),
          
          
        )
        ,
        Strokbutton(onPressed: () { GoRouter.of(context).push(router.kSingupview); },)
      ],
     ),
   );
  }

}





