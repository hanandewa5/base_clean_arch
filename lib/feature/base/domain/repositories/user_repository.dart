import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';

abstract class UserRepository {
  Future<UserStateEntities> login(LoginParam params);

  Future<void> logout();

  Future<void> updateUser(int a);
}
