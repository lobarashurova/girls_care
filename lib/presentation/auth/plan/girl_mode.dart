import 'package:hive_flutter/adapters.dart';

enum GirlMode { pregnant, period, afterbirth, klimaks }

class GirlModeAdapter extends TypeAdapter<GirlMode> {
  @override
  final typeId = 1; // Unique ID for the adapter

  @override
  GirlMode read(BinaryReader reader) {
    return GirlMode.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, GirlMode obj) {
    writer.writeInt(obj.index);
  }
}
