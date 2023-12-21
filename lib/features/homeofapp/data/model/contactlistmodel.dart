import 'package:hive_flutter/hive_flutter.dart';

import 'cotactmodel.dart';

class ContactsList extends HiveObject{
  List<ContactModel> contacts;

  ContactsList({
    required this.contacts,
  });
}
