// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsAdapter extends TypeAdapter<Events> {
  @override
  final int typeId = 0;

  @override
  Events read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Events(
      createdAt: fields[0] as String?,
      markets: (fields[1] as List?)?.cast<Markets>(),
      imageUrl: fields[2] as String?,
      image128Url: fields[3] as String?,
      id: fields[4] as String?,
      title: fields[5] as String?,
      type: fields[6] as String?,
      description: fields[7] as String?,
      category: fields[8] as String?,
      hashtags: (fields[9] as List?)?.cast<String>(),
      countryCodes: (fields[10] as List?)?.cast<dynamic>(),
      regions: (fields[11] as List?)?.cast<dynamic>(),
      status: fields[12] as String?,
      resolutionDate: fields[13] as String?,
      resolutionSource: fields[14] as dynamic,
      supportedCurrencies: (fields[15] as List?)?.cast<String>(),
      totalVolume: fields[16] as dynamic,
      totalOrders: fields[17] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Events obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.createdAt)
      ..writeByte(1)
      ..write(obj.markets)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.image128Url)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.hashtags)
      ..writeByte(10)
      ..write(obj.countryCodes)
      ..writeByte(11)
      ..write(obj.regions)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.resolutionDate)
      ..writeByte(14)
      ..write(obj.resolutionSource)
      ..writeByte(15)
      ..write(obj.supportedCurrencies)
      ..writeByte(16)
      ..write(obj.totalVolume)
      ..writeByte(17)
      ..write(obj.totalOrders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
