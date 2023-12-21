

import 'package:flutter/material.dart';
import 'package:silent/features/splashscreen/presention/view/widget/bodyofsplashscreen.dart';

class SPlash extends StatelessWidget{
  const SPlash({super.key});

  @override
  Widget build(BuildContext context) {
   
  return Container(
    decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3B26B8), Color(0xFF05D2D9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),),
    child: const Scaffold(
  backgroundColor:Colors.transparent,
        body: bodyspliah(),
      ),
  );
  }

}