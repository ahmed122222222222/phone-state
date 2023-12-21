import 'dart:typed_data';

import 'package:contacts_service/contacts_service.dart' as contacts_service;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:silent/features/homeofapp/data/model/phonemodel.dart';

class ContactModel extends HiveObject {
  final String displayName;
  final List<PhoneModel> phones;
  Uint8List? avatar; // إضافة حقل "avatar"

  ContactModel({
    required this.displayName,
    required this.phones,
    this.avatar,
  });
   factory ContactModel.fromContact(contacts_service.Contact contact) {
    // قم بإنشاء PhoneModel لكل جهاز اتصال
    List<PhoneModel> phones = [];
    for (var phone in contact.phones!) {
      phones.add(PhoneModel(
        label: phone.label,
        value: phone.value!,
      ));
    }

    return ContactModel(
      displayName: contact.displayName ?? "",
      phones: phones,
      avatar: contact.avatar,
    );
  }
}
