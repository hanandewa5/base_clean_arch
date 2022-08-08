// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginEntitiesAdapter extends TypeAdapter<LoginEntities> {
  @override
  final int typeId = 99;

  @override
  LoginEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginEntities(
      token: fields[0] as String?,
      passwordExpired: fields[1] as bool?,
      userName: fields[2] as String?,
      fullName: fields[3] as String?,
      subscription: fields[4] as String?,
      billingPhone: fields[5] as String?,
      phone: fields[6] as String?,
      roles: (fields[7] as List?)?.cast<dynamic>(),
      restoreId: fields[8] as String?,
      acls: (fields[9] as List?)?.cast<int>(),
      currentLocation: fields[10] as int?,
      packageId: fields[11] as int?,
      trialLeft: fields[12] as int?,
      showGettingStarted: fields[13] as bool?,
      showOnboardingWizard: fields[14] as bool?,
      currentCompany: fields[15] as int?,
      companies: fields[16] as String?,
      isOwner: fields[17] as bool?,
      posShowGettingStarted: fields[18] as bool?,
      enableFulfillment: fields[19] as bool?,
      isWmsMigrated: fields[20] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginEntities obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.passwordExpired)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.subscription)
      ..writeByte(5)
      ..write(obj.billingPhone)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.roles)
      ..writeByte(8)
      ..write(obj.restoreId)
      ..writeByte(9)
      ..write(obj.acls)
      ..writeByte(10)
      ..write(obj.currentLocation)
      ..writeByte(11)
      ..write(obj.packageId)
      ..writeByte(12)
      ..write(obj.trialLeft)
      ..writeByte(13)
      ..write(obj.showGettingStarted)
      ..writeByte(14)
      ..write(obj.showOnboardingWizard)
      ..writeByte(15)
      ..write(obj.currentCompany)
      ..writeByte(16)
      ..write(obj.companies)
      ..writeByte(17)
      ..write(obj.isOwner)
      ..writeByte(18)
      ..write(obj.posShowGettingStarted)
      ..writeByte(19)
      ..write(obj.enableFulfillment)
      ..writeByte(20)
      ..write(obj.isWmsMigrated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
