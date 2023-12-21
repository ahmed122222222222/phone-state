import 'package:go_router/go_router.dart';
import 'package:silent/features/homepage/presention/view/home.dart';
import 'package:silent/features/loginscreen/presention/view/login.dart';
import 'package:silent/features/loginscreen/presention/view/singup.dart';
import 'package:silent/features/loginscreen/presention/view/widget/vaildation.dart';
import 'package:silent/features/restscreen/presntion/view/send.dart';
import 'package:silent/features/splashscreen/presention/view/splashscreen.dart';

abstract class router {
 static const kHomeView = '/Home';
 static const kloginview='/Login';
 static const kSingupview='/Singup';
 static const ksendview='/Send';
 static const kvaild='/vaildation';
  static final routerr=GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SPlash(),
    ),
GoRoute(
      path: kHomeView,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: kloginview,
      builder: (context, state) =>  Login(),
    ),
    GoRoute(
      path: kSingupview,
      builder: (context, state) =>  Signup(),
    ),
    GoRoute(
      path: ksendview,
      builder: (context, state) =>  Semf(),
    ),
     GoRoute(
      path: kvaild,
      builder: (context, state) =>  Vaildation(),
    ),
    
    ]
    
    );

}