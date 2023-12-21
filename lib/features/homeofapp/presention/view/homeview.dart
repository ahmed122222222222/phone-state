import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/presention/manager/contact/contact_cubit.dart';
import 'package:silent/features/homeofapp/presention/view/account.dart';
import 'package:silent/features/homeofapp/presention/view/contact.dart';
import 'package:silent/features/homeofapp/presention/view/seting.dart';
import 'package:silent/features/homeofapp/presention/view/wideget/fav.dart';

import '../manager/cubit/fav_cubit.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> screens = [
  fav(),
   ContactsPage(),
   settin(),
   Account()
  ];
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      BlocProvider.of<ContactCubit>(context).get();
      BlocProvider.of<FavCubit>(context).loadContactsFromHive();
    });
  }
 @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xABD9D9),
        unselectedItemColor: Colors.black45,
        fixedColor: const Color.fromARGB(255, 115, 24, 251),
        selectedLabelStyle: styels.font12,
        currentIndex: currentIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'المفضله',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone_rounded),
            label: 'جهات الاتصال',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الاعدادت',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            label: 'الحساب',
          ),
        ],
      ),
    appBar: AppBar(

      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Image.asset("asset/image/لولو.png"),
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 53,
          width: 54,
          child: Image.asset("asset/image/notifications_off.png")),
      )],
    ),
   );
  }
}