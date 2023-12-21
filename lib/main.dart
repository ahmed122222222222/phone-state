import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:silent/constant.dart';


import 'package:silent/core/instance.dart';
import 'package:silent/core/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent/features/homeofapp/data/contactrepimp.dart';
import 'package:silent/features/homeofapp/presention/manager/contact/contact_cubit.dart';


import 'package:silent/features/homeofapp/presention/manager/load/loadphone_cubit.dart';
import 'package:sound_mode/permission_handler.dart';

import 'package:silent/features/loginscreen/data/repoimp.dart';
import 'package:silent/features/loginscreen/presention/manager/cubit/singup_cubit.dart';
import 'package:silent/features/loginscreen/presention/manager/login/login_cubit.dart';


import 'features/homeofapp/data/model/contactlistmodel.dart';
import 'features/homeofapp/data/model/contactlistmodel.g.dart';

import 'features/homeofapp/data/model/cotactmodel.g.dart';
import 'features/homeofapp/data/model/phonemodel.g.dart';
import 'features/homeofapp/presention/manager/cubit/fav_cubit.dart';
import 'features/loginscreen/data/loginimp.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main()async {
  
   WidgetsFlutterBinding.ensureInitialized();
   
 Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform); 
 await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());

   Hive.registerAdapter(PhoneModelAdapter());
    Hive.registerAdapter(ContactsListAdapter());
   await Hive.openBox<ContactsList>(box);
 
 
requestPermission().then((permissionStatus) {
    if (permissionStatus == PermissionStatus.granted) {
      runApp(MyApp());
    } else {
      // Handle the scenario when permission is denied or restricted
    }
  });
}

Future<PermissionStatus> requestPermission() async {
  PermissionStatus status = await Permission.contacts.request();
  return status;  
}






class MyApp extends StatefulWidget {
  
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  void initState() {
    super.initState();
    requestPermission();
    _getPermissionStatus();
  }
  
  Future<bool> requestPermission() async {
    final status = await Permission.phone.request();
    return status.isGranted;
    
  }
   Future<void> _getPermissionStatus() async {
    bool? permissionStatus = false;
    try {
      permissionStatus = await PermissionHandler.permissionsGranted;
      print(permissionStatus);
    } catch (err) {
      print(err);
    }

    setState(() {
    });
    
  }
  Future<void> _openDoNotDisturbSettings() async {
    await PermissionHandler.openDoNotDisturbSetting();
  }
  @override

  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      providers: [
       BlocProvider<SingupCubit>(
          create: (context) => SingupCubit(singuprepoimp: getIt.registerSingleton(Singuprepoimp())),
          
         ),
         BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(loginrepo: getIt.registerSingleton(Loginimp())),
          
         )
         ,
         BlocProvider<ContactCubit>(
          create: (context) => ContactCubit(con: getIt.registerSingleton(contactrepoim())),
          
         )
         ,
         BlocProvider<FavCubit>(
          create: (context) => FavCubit()..loadContactsFromHive(),
          
         )
         ,
         BlocProvider<LoadphoneCubit>(
          create: (context) => LoadphoneCubit(),
          
         )
      ],
      child: MaterialApp.router(
        locale: Locale('ar'),
          localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
        routerConfig: router.routerr,
      ),
    );
  }
}



