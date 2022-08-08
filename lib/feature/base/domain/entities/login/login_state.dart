import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserStateEntities? userStateEntities;
  final String? locationName;
  const LoginSuccess({required this.userStateEntities, required this.locationName});

  @override
  List<Object?> get props => [userStateEntities, locationName];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
