import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/presention/view/contact.dart';


import '../../manager/cubit/fav_cubit.dart';

class fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favbody(),
    );
  }
}

class favbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        
       if(state is FavSucess)  { return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                
                itemCount: state.contact!.length,
                // Replace with the number of items you want to display
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Customlisttile(str: state.contact[index].contacts[0].displayName, onPressed: () { 
                      state.contact[index].delete();
                      BlocProvider.of<FavCubit>(context).loadContactsFromHive(); }, avatarData: state.contact[index].contacts[0].avatar, phone: state.contact[index].contacts[0].phones[0].value,),
                  );
                },
              ),
            ),
            FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 115, 24, 251),
              onPressed: () {
                showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ContactsPage();
                },
                isScrollControlled: false, // هذا يجعل الواجهة الخلفية تمتلئ بالشاشة بالكامل
              );
              },
              child: Icon(Icons.add),
            ),
          ],
        );}
        else{
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }
}

class Customlisttile extends StatelessWidget {
  final String str,phone;
final void Function()? onPressed;
final Uint8List? avatarData;
  const Customlisttile({super.key, required this.str,required this.onPressed,required this.avatarData, required this.phone});
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
          str ,
            style: styels.font20.copyWith(color: Colors.black87),
          ),
          subtitle:  Text(phone,style: styels.font12,),
          trailing: IconButton(icon: Image.asset("asset/image/delete.png"),onPressed:onPressed ,),
          leading: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 100, // تعيين حجم الدائرة هنا
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // تحويل الصورة إلى دائرة
              color: Color(0xFF9747FF), // لون الخلفية
            ),
            child: Center(
    child: avatarData != null && avatarData!.isNotEmpty
      ? Image.memory(avatarData!)
      : Text(
        str.isNotEmpty ? str[0] : "0",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
  ),
          ),
        ],
      ),),
        Divider(
          thickness: 1,
          color: Color(0xFF9747FF),
        )
      ],
    );
  }
}
