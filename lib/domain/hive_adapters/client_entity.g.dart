// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/client_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientEntityAdapter extends TypeAdapter<ClientEntity> {
  @override
  final int typeId = 0;

  @override
  ClientEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClientEntity(
      id: fields[0] as String,
      cnpj: fields[1] as String,
      cpf: fields[2] as String,
      name: fields[3] as String,
      corporateName: fields[4] as String,
      email: fields[5] as String,
      birthDate: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ClientEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cnpj)
      ..writeByte(2)
      ..write(obj.cpf)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.corporateName)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.birthDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
