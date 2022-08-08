import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_entities.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';

class LocalDataSource {
  final HiveService hive;

  const LocalDataSource({required this.hive});

  //#region GET

  Future<String?> getToken() async {
    return await hive.getToken();
  }

  Future<LoginEntities?> getUserAccount() async {
    return await hive.getUserAccount();
  }

  Future<void> logout() async {
    await hive.logout();
  }

  //#endregion GET

  //#region SAVE

  Future<void> saveToken(String token) async {
    await hive.saveToken(token);
  }

  Future<void> saveLoginEntities(LoginEntities loginEntities) async {
    await hive.saveLoginEntities(loginEntities);
  }

  Future<void> saveUserState(UserStateEntities userStateEntities) async {
    await hive.saveUserState(userStateEntities);
  }

  //#endregion SAVE

}
