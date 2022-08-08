import 'package:base_clean_arch/core/abstract/usecase.dart';
import 'package:base_clean_arch/core/exceptions/server_exception.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_state.dart';
import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/domain/usecases/login_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUseCase loginUserUseCase;

  LoginCubit({
    required this.loginUserUseCase,
  }) : super(LoginInit());

  postLogin(LoginParam loginParam) async {
    emit(LoginLoading());
    try {
      final UserStateEntities userStateEntities = await loginUserUseCase.invoke(loginParam);
      if (userStateEntities == UserStateEntities.cashier) {
        emit(LoginSuccess(userStateEntities: userStateEntities, locationName: 'Semarang'));
      } else {
        final UserStateEntities userStateEntities = await loginUserUseCase.invoke(loginParam);
        emit(LoginSuccess(userStateEntities: userStateEntities, locationName: 'Semarang'));
      }
    } on ServerException catch (error) {
      emit(LoginFailed(message: error.message.toString()));
    }
  }
}
