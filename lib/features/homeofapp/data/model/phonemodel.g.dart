import 'package:hive/hive.dart';
import 'package:silent/features/homeofapp/data/model/phonemodel.dart';

class PhoneModelAdapter extends TypeAdapter<PhoneModel> {
  @override
  final int typeId = 1;

  @override
  PhoneModel read(BinaryReader reader) {
    final label = reader.readString();
    final value = reader.readString();

    return PhoneModel(
      label: label,
      value: value,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneModel obj) {
    writer.writeString(obj.label ?? '');
    writer.writeString(obj.value);
  }
}
