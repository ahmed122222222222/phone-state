

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent/constant.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/data/contactrepimp.dart';
import 'package:silent/features/homeofapp/presention/manager/cubit/fav_cubit.dart';
import 'package:silent/features/homeofapp/presention/manager/load/loadphone_cubit.dart';
import 'package:silent/features/homeofapp/presention/manager/load/search.dart';
import 'package:silent/features/homeofapp/presention/view/wideget/fav.dart';
import 'package:silent/features/homeofapp/presention/view/wideget/serachpage.dart';
var com;
class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact>? _contacts;
contactrepoim con=contactrepoim();
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocConsumer<LoadphoneCubit, LoadphoneState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Loadphonesucess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:26,left: 15,right: 20),
                  child: Text("جهات الاتصال",style: styels.font20.copyWith(color: Colors.black87,fontFamily: fontfamily,fontSize: 28),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Text("${state.conn.length}جهه اتصال",style: styels.font16.copyWith(color: Colors.black54),),
                ),
                SizedBox(height: 20,),
                
            
              serach(),
             SizedBox(height: 3,) ,  
                Expanded(
                  child: ListView.builder(
                    itemCount: state.conn.length * 2 - 1,
                    // Multiply by 2 to account for dividers
                    itemBuilder: (BuildContext context, int index) {
                      if (index.isOdd) {
                        // If index is odd, return a Divider
                        return const Divider(
                          color: Color.fromARGB(255, 160, 141, 227),
                          thickness: 1,
                        );
                      }

                      Contact contact = state.conn!.elementAt(index ~/ 2);
                      String initials = contact.displayName?[0] ?? '';

                      return ListTile(
                        title: Text(contact.displayName ?? '',style: styels.font20.copyWith(color: Colors.black87),),
                        subtitle: Text(contact.phones!.isNotEmpty
                            ? contact.phones!.first.value.toString()
                            : '',style: styels.font16,),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 96, 52, 240),
                          child: contact.avatar!.isEmpty
                              ? Text(initials, style: TextStyle(color: Colors.white))
                              : Image.memory(contact.avatar!),
                        ),
                        trailing: IconButton(icon: const Icon(Icons.add),onPressed: (){
                   con.addContactToHive(contact);
                        },),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


class label extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => fav()));
      },
     child: TextField(
            
              decoration: InputDecoration(
                enabled: false,
           contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              hintText: "اابجث عن  جهه الاتصال ",hintStyle: styels.font12,
              suffixIcon: const Icon(Icons.search),
             fillColor: Color.fromARGB(165, 200, 199, 199),
            filled: true,
              border: OutlineInputBorder(
                          
                borderRadius: BorderRadius.circular(5),
               
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color: Color(0xFF3B26B8) )
              )
                  
                ),
               
           
            ),
   );
   
  }
  
}