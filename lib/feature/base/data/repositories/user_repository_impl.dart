import 'package:base_clean_arch/feature/base/data/datasources/local_data_source.dart';
import 'package:base_clean_arch/feature/base/data/datasources/remote_data_source.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_entities.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  //#region FUNCTION

  @override
  Future<UserStateEntities> login(LoginParam loginParam) async {
    final LoginEntities loginEntities =
        await remoteDataSource.loginUser(loginParam);
    localDataSource.saveLoginEntities(loginEntities);

    await localDataSource.saveUserState(UserStateEntities.loggedIn);
    await localDataSource.saveToken(loginEntities.token ?? '');
    return UserStateEntities.loggedIn;
  }

  @override
  Future<void> logout() async {
    await localDataSource.logout();
    return;
  }

  @override
  Future<void> logouts() async {
    await localDataSource.logout();
    return;
  }

  @override
  Future<void> updateUser(int a) async {
    await localDataSource.logout();
    return;
  }

  //#endregion

}
