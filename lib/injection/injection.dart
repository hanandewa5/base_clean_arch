import 'package:base_clean_arch/core/services/base_api_client.dart';
import 'package:base_clean_arch/feature/base/data/datasources/local_data_source.dart';
import 'package:base_clean_arch/feature/base/data/datasources/remote_data_source.dart';
import 'package:base_clean_arch/feature/base/data/repositories/user_repository_impl.dart';
import 'package:base_clean_arch/feature/base/data/services/api_service.dart';
import 'package:base_clean_arch/feature/base/data/services/hive_service.dart';
import 'package:base_clean_arch/feature/base/domain/repositories/user_repository.dart';
import 'package:base_clean_arch/feature/base/domain/usecases/login_user_usecase.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_cubit.dart';
import 'package:get_it/get_it.dart';
final GetIt di = GetIt.instance;

Future<void> init() async {
  //#region BLoCs

  di.registerFactory(
    () => LoginCubit(
      loginUserUseCase: di(),
    ),
  );

  //#endregion

  //#region USE CASES

  di.registerLazySingleton(
    () => LoginUserUseCase(
      repository: di(),
    ),
  );

  //#endregion

  //#region REPOSITORIES

  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: di(),
      localDataSource: di(),
    ),
  );

  //#endregion

  //#region DATA SOURCES

  di.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(
      service: di(),
    ),
  );

  di.registerLazySingleton<LocalDataSource>(
    () => LocalDataSource(
      hive: di(),
    ),
  );

  //#endregion

  //#region SERVICES

  di.registerLazySingleton<ApiService>(
    () => ApiService(
      apiClient: di(),
    ),
  );

  di.registerLazySingleton<HiveService>(
    HiveService.new,
  );

  //#endregion

  //#region CORES

  di.registerLazySingleton<BaseApiClient>(
    BaseApiClient.new,
  );

  //#endregion
}
