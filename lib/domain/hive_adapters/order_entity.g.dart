// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entities/order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 3;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      id: fields[0] as String,
      number: fields[1] as int,
      creationDate: fields[2] as DateTime,
      modificationDate: fields[3] as DateTime,
      status: fields[4] as String,
      discount: fields[5] as double,
      shipping: fields[6] as double,
      subTotal: fields[7] as double,
      totalAmount: fields[8] as double,
      client: fields[9] as ClientEntity,
      deliveryAddress: fields[10] as DeliveryAddressEntity,
      items: (fields[11] as List).cast<ItemEntity>(),
      payments: (fields[12] as List).cast<PaymentEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.creationDate)
      ..writeByte(3)
      ..write(obj.modificationDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.shipping)
      ..writeByte(7)
      ..write(obj.subTotal)
      ..writeByte(8)
      ..write(obj.totalAmount)
      ..writeByte(9)
      ..write(obj.client)
      ..writeByte(10)
      ..write(obj.deliveryAddress)
      ..writeByte(11)
      ..write(obj.items)
      ..writeByte(12)
      ..write(obj.payments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
