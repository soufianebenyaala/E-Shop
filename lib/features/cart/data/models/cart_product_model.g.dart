// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductModelAdapter extends TypeAdapter<CartProductModel> {
  @override
  final int typeId = 2;

  @override
  CartProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductModel(
      id: fields[0] as int,
      title: fields[1] as String,
      price: fields[2] as double,
      quantity: fields[3] as int,
      total: fields[4] as double,
      discountPercentage: fields[5] as double,
      discountedTotal: fields[6] as double,
      thumbnail: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.discountPercentage)
      ..writeByte(6)
      ..write(obj.discountedTotal)
      ..writeByte(7)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
