// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStateEntitiesAdapter extends TypeAdapter<UserStateEntities> {
  @override
  final int typeId = 1;

  @override
  UserStateEntities read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserStateEntities.notLoggedIn;
      case 1:
        return UserStateEntities.loggedIn;
      case 2:
        return UserStateEntities.priceChecker;
      case 3:
        return UserStateEntities.cashier;
      default:
        return UserStateEntities.notLoggedIn;
    }
  }

  @override
  void write(BinaryWriter writer, UserStateEntities obj) {
    switch (obj) {
      case UserStateEntities.notLoggedIn:
        writer.writeByte(0);
        break;
      case UserStateEntities.loggedIn:
        writer.writeByte(1);
        break;
      case UserStateEntities.priceChecker:
        writer.writeByte(2);
        break;
      case UserStateEntities.cashier:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStateEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
