import 'package:hive/hive.dart';

import 'contactlistmodel.dart';
import 'cotactmodel.dart';

class ContactsListAdapter extends TypeAdapter<ContactsList> {
  @override
  final int typeId = 3;

  @override
  ContactsList read(BinaryReader reader) {
    final contacts = reader.readList().cast<ContactModel>();

    return ContactsList(contacts: contacts);
  }

  @override
  void write(BinaryWriter writer, ContactsList obj) {
    writer.writeList(obj.contacts);
  }
}
