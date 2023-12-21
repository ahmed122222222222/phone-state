import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:silent/features/homeofapp/data/model/phonemodel.dart';

import 'cotactmodel.dart';

class ContactModelAdapter extends TypeAdapter<ContactModel> {
  @override
  final int typeId = 0;

  @override
  ContactModel read(BinaryReader reader) {
    final displayName = reader.readString();
    final phones = reader.readList().cast<PhoneModel>();
        final avatar = Uint8List.fromList(reader.readByteList());// قراءة حقل "avatar"

    return ContactModel(
      displayName: displayName,
      phones: phones,
      avatar: avatar,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer.writeString(obj.displayName);
    writer.writeList(obj.phones);
    writer.writeByteList(obj.avatar!.toList());  // كتابة حقل "avatar"
  }
}
