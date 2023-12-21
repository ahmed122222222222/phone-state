import 'package:hive_flutter/hive_flutter.dart';

class PhoneModel extends HiveObject{
  final String? label;
  final String value;

  PhoneModel({
    this.label,
    required this.value,
  });
}
