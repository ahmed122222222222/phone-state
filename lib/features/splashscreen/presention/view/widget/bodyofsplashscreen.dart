import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silent/core/router.dart';
import 'package:silent/core/styels.dart';

import '../../../../homeofapp/presention/manager/load/loadphone_cubit.dart';

class bodyspliah extends StatefulWidget {
  const bodyspliah({Key? key}) : super(key: key);

  @override
  State<bodyspliah> createState() => _bodyspliahState();
}

class _bodyspliahState extends State<bodyspliah>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sildinganmation;
  @override
  void initState() {
    super.initState();
    slidinganmation();
    navhome();
    BlocProvider.of<LoadphoneCubit>(context).getContacts();
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset("asset/image/logo.png"),
   const SizedBox(height: 5,),
    AnimatedBuilder(
      animation: sildinganmation,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: sildinganmation,
          child: const Center(
            child: Text(
              "Lolo",
              style: styels.font64,
            ),
          ),
        );
      },
    ),
  ],
);}

//function

  void slidinganmation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sildinganmation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

//nav
  Future<Null> navhome() {
    return Future.delayed(const Duration(seconds: 2), () {
      
      GoRouter.of(context).push(router.kHomeView);
    });
  }
}
