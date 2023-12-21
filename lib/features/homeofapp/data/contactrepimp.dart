// ignore: camel_case_types



import 'package:contacts_service/contacts_service.dart' as contacts_service;
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:silent/core/styels.dart';

import 'package:silent/features/homeofapp/data/contactrepo.dart';
import 'package:silent/features/homeofapp/presention/view/contact.dart';

import '../../../constant.dart';
import 'model/contactlistmodel.dart';
import 'model/cotactmodel.dart';


// ignore: camel_case_types
class contactrepoim extends contactrpo {




Future<List<contacts_service.Contact>> fetchContacts() async {
  List<contacts_service.Contact> contacts = [];
  try {
    final Iterable<contacts_service.Contact> allContacts = await contacts_service.ContactsService.getContacts();
    contacts = allContacts.toList();
  } catch (e) {
    print("Error fetching contacts: $e");
  }
  return contacts;
}


List<contacts_service.Contact> contacts = [];



Future<void> addContactToHive(contacts_service.Contact contact) async {
  try {
    final contactsBox = Hive.box<ContactsList>(box);
    final List<ContactsList> savedContactsLists = contactsBox.values.toList();
    final List<ContactModel> savedContacts = savedContactsLists.expand((list) => list.contacts).toList();

    bool isContactExists = savedContacts.any((savedContact) =>
        savedContact.phones[0].value.toString() == contact.phones![0].value.toString());

    if (!isContactExists) {
      // الجهة غير موجودة، يمكنك إضافتها
      final contactModel = ContactModel.fromContact(contact);
      final contactsList = ContactsList(contacts: [contactModel]);
      contactsBox.add(contactsList);

      const snackBar = SnackBar(
        content: Text("تمت إضافة جهة الاتصال بنجاح", style: styels.font12,),
        backgroundColor: Color(0xFF3B26B8),
      );
      ScaffoldMessenger.of(com).showSnackBar(snackBar);
    } else {
      // الجهة موجودة بالفعل
      const snackBar = SnackBar(
        content: Text("جهة الاتصال موجودة بالفعل", style: styels.font12,),
        backgroundColor: Color(0xFF3B26B8),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(com).showSnackBar(snackBar);
    }
  } catch (e) {
    print("Error adding contact to Hive: $e");
  }
}

  @override
  List<contacts_service.Contact> fav(contacts_service.Contact contact) {
    // TODO: implement fav
    throw UnimplementedError();
  }

Future<List<Contact>> getphonedata() async{
    List<Contact> contacts=[];
 if (await FlutterContacts.requestPermission()) {
 contacts = await FlutterContacts.getContacts(
       withProperties: true, withPhoto: true);
}
   return contacts;   
}
  }

  

