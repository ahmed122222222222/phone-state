
import 'package:get_it/get_it.dart';
import 'package:silent/features/homeofapp/data/contactrepimp.dart';
import 'package:silent/features/loginscreen/data/Loginrepo.dart';
import 'package:silent/features/loginscreen/data/loginimp.dart';
import 'package:silent/features/loginscreen/data/repoimp.dart';

final getIt = GetIt.instance;
void setup()
{
  getIt.registerSingleton<Singuprepoimp>(Singuprepoimp());
   getIt.registerSingleton<Loginrepo>(Loginimp());
      getIt.registerSingleton<contactrepoim>(contactrepoim());
}