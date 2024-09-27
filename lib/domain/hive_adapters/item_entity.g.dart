// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemEntityAdapter extends TypeAdapter<ItemEntity> {
  @override
  final int typeId = 2;

  @override
  ItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemEntity(
      id: fields[0] as String,
      productId: fields[1] as String,
      name: fields[2] as String,
      quantity: fields[3] as int,
      unitPrice: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ItemEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.unitPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
