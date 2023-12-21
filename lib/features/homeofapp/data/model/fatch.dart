import 'package:contacts_service/contacts_service.dart';
Future<List<Contact>> fetchContacts() async {
    return await ContactsService.getContacts();
   
  }