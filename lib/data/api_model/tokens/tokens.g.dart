// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokensImplAdapter extends TypeAdapter<_$TokensImpl> {
  @override
  final int typeId = 1;

  @override
  _$TokensImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TokensImpl(
      refresh: fields[0] as String?,
      access: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$TokensImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.refresh)
      ..writeByte(1)
      ..write(obj.access);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokensImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokensImpl _$$TokensImplFromJson(Map<String, dynamic> json) => _$TokensImpl(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
    );

Map<String, dynamic> _$$TokensImplToJson(_$TokensImpl instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
