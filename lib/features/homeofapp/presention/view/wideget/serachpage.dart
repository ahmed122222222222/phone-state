


import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/content/v2_1.dart';
import 'package:silent/core/styels.dart';
import 'package:silent/features/homeofapp/presention/manager/load/loadphone_cubit.dart';

import '../../../data/model/fatch.dart';


class searchpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchContactsScreen(),
    );

  }

}

class SearchContactsScreen extends StatefulWidget {
  @override
  _SearchContactsScreenState createState() => _SearchContactsScreenState();
}

class _SearchContactsScreenState extends State<SearchContactsScreen> {
  
  List<Contact> allContacts = [];
  List<Contact> searchResults = [];
  TextEditingController searchController = TextEditingController();
  bool hasResults = false;

  @override
  void initState() {
    super.initState();
    fetchAllContacts();
  }

  Future<void> fetchAllContacts() async {
    List<Contact> contacts =await fetchContacts() ;
    setState(() {
      allContacts = contacts;
    });
  }

  void performSearch(String query) {
    final List<Contact> matchingContacts = allContacts.where((contact) {
      return contact.displayName?.toLowerCase().contains(query.toLowerCase()) == true;
    }).toList();

    setState(() {
      searchResults = matchingContacts;
      hasResults = searchResults.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:40.0,right: 10,left: 010),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              
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
             
           
            onChanged: (query) {
              performSearch(query);
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
               String initials = searchResults[index].displayName?[0] ?? '';
              return ListTile(
                        title: Text(searchResults[index].displayName ?? '',style: styels.font20.copyWith(color: Colors.black87),),
                        subtitle: Text(searchResults[index].phones!.isNotEmpty
                            ? searchResults[index].phones!.first.value.toString()
                            : '',style: styels.font16,),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 96, 52, 240),
                          child: searchResults[index].avatar!.isEmpty
                              ? Text(initials, style: TextStyle(color: Colors.white))
                              : Image.memory(searchResults[index].avatar!),
                        ),
                        trailing: Icon(Icons.add),
                      );();
            },
          ),
        ),
        Visibility(
          visible: !hasResults,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(color:Color(0xFF3B26B8) )
                
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text('لا يوجد جهه اتصال بهذا الاسم',style: styels.font20.copyWith(color: Color.fromARGB(221, 141, 119, 219)),),
                )),
            ),
          ),
        ),
      ],
    );
  }
}
