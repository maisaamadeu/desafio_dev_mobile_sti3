// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/payment_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentEntityAdapter extends TypeAdapter<PaymentEntity> {
  @override
  final int typeId = 4;

  @override
  PaymentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaymentEntity(
      id: fields[0] as String,
      installment: fields[1] as int,
      value: fields[2] as double,
      code: fields[3] as String,
      name: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PaymentEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.installment)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
