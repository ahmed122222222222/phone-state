

import 'package:bloc/bloc.dart';


import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';



import '../../../data/contactrepimp.dart';

import '../../../data/model/fatch.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({required this.con}) : super(ContactInitial());
  contactrepoim   con;
 List<List<Contact>>cont=[];
  void get ()async   {
    emit(Contactload());
    try {
    var re= await fetchContacts();
    emit(Contactsucess(contact: re));
    } catch (e) {
      emit( Contactfailuer());
    }
  
  }
}
  /*void add (contacts_service.Contact contact) async{
    try {
  emit(Contactload());
   con.addContactToHive(contact);




 List<Contact> contacts = [];
 contacts=await con.getphonedata();
emit(Contactsucess(contacts: contacts));
  

} on Exception catch (e) {
  emit(Contactfailuer());
}
  }


}
  

 */ 