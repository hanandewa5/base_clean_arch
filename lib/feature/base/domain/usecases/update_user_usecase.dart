import '../../../../core/abstract/usecase.dart';
import '../entities/login/login_params.dart';
import '../repositories/user_repository.dart';

class LoginUserUseCase implements UseCase<int, void> {
  final UserRepository repository;

  LoginUserUseCase({required this.repository});

  @override
  Future<void> invoke(int params) async {
    await repository.updateUser(params);
  }
}
