import 'package:base_clean_arch/core/constants/hive_constants.dart';
import 'package:base_clean_arch/core/services/base_hive_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_entities.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService extends BaseHiveService {
  @override
  void registerAdapter() {
    Hive.registerAdapter(UserStateEntitiesAdapter());
  }

  //#region GET

  Future<bool> getFirstTimeLaunch() async {
    bool? isFirstTime = await getOne(boxName: HiveConstants.boxToken, keyName: HiveConstants.keyFirstTime);
    return isFirstTime ?? true;
  }

  Future<String?> getToken() async {
    return await getOne(boxName: HiveConstants.boxUser, keyName: HiveConstants.keyToken);
  }

  Future<String?> getLocationName() async {
    return await getOne(boxName: HiveConstants.boxOutlet, keyName: HiveConstants.keyLocationName);
  }

  Future<LoginEntities?> getUserAccount() async {
    return await getOne(boxName: HiveConstants.boxUser, keyName: HiveConstants.keyUser);
  }

  Future<UserStateEntities?> getUserState() async {
    return await getOne(boxName: HiveConstants.boxUserState, keyName: HiveConstants.keyUserState);
  }

  //#endregion GET

  //#region SAVE

  Future<void> setFirstTimeLaunch(bool isFirstTime) async {
    await insertOne(boxName: HiveConstants.boxToken, keyName: HiveConstants.keyFirstTime, data: isFirstTime);
  }

  Future<void> saveToken(String token) async {
    await insertOne(boxName: HiveConstants.boxUser, keyName: HiveConstants.keyToken, data: token);
  }

  Future<void> saveLoginEntities(LoginEntities loginEntities) async {
    await insertOne(boxName: HiveConstants.boxUser, keyName: HiveConstants.keyUser, data: loginEntities);
  }

  Future<void> saveUserState(UserStateEntities userStateEntities) async {
    await insertOne(boxName: HiveConstants.boxUserState, keyName: HiveConstants.keyUserState, data: userStateEntities);
  }

  //#endregion SAVE

  //#region DELETE

  Future<void> deleteLocationName() async {
    await deleteOne(boxName: HiveConstants.boxOutlet, keyName: HiveConstants.keyLocationName);
  }

  Future<void> logout() async {
    deleteOne(boxName: HiveConstants.boxUser, keyName: HiveConstants.keyToken);
    deleteOne(boxName: HiveConstants.boxUserState, keyName: HiveConstants.keyUserState);
  }

  //#endregion
}
