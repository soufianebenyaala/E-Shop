// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 1;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      id: fields[0] as int,
      products: (fields[1] as List).cast<CartProductModel>(),
      total: fields[2] as double,
      discountedTotal: fields[3] as double,
      userId: fields[4] as int,
      totalProducts: fields[5] as int,
      totalQuantity: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.products)
      ..writeByte(2)
      ..write(obj.total)
      ..writeByte(3)
      ..write(obj.discountedTotal)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.totalProducts)
      ..writeByte(6)
      ..write(obj.totalQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
