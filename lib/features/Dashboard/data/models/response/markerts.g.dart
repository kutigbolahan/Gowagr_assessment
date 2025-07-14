// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markerts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketsAdapter extends TypeAdapter<Markets> {
  @override
  final int typeId = 1;

  @override
  Markets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Markets(
      id: fields[0] as String?,
      title: fields[1] as String?,
      rules: fields[2] as String?,
      imageUrl: fields[3] as String?,
      image128Url: fields[4] as String?,
      yesBuyPrice: fields[5] as dynamic,
      noBuyPrice: fields[6] as dynamic,
      yesPriceForEstimate: fields[7] as dynamic,
      noPriceForEstimate: fields[8] as dynamic,
      status: fields[9] as String?,
      resolvedOutcome: fields[10] as dynamic,
      volumeValueYes: fields[11] as dynamic,
      volumeValueNo: fields[12] as dynamic,
      yesProfitForEstimate: fields[13] as dynamic,
      noProfitForEstimate: fields[14] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Markets obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.rules)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.image128Url)
      ..writeByte(5)
      ..write(obj.yesBuyPrice)
      ..writeByte(6)
      ..write(obj.noBuyPrice)
      ..writeByte(7)
      ..write(obj.yesPriceForEstimate)
      ..writeByte(8)
      ..write(obj.noPriceForEstimate)
      ..writeByte(9)
      ..write(obj.status)
      ..writeByte(10)
      ..write(obj.resolvedOutcome)
      ..writeByte(11)
      ..write(obj.volumeValueYes)
      ..writeByte(12)
      ..write(obj.volumeValueNo)
      ..writeByte(13)
      ..write(obj.yesProfitForEstimate)
      ..writeByte(14)
      ..write(obj.noProfitForEstimate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
