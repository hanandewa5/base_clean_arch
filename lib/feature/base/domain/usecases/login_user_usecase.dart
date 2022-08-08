

import 'package:base_clean_arch/core/abstract/usecase.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/domain/repositories/user_repository.dart';

class LoginUserUseCase implements UseCase<LoginParam, UserStateEntities> {
  final UserRepository repository;

  LoginUserUseCase({required this.repository});

  @override
  Future<UserStateEntities> invoke(LoginParam params) async {
    return await repository.login(params);
  }
}
