import 'package:base_clean_arch/feature/base/domain/entities/user_state/user_state_entities.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/home/home_page.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_cubit.dart';
import 'package:base_clean_arch/feature/base/presentation/modules/login/login_screen.dart';
import 'package:base_clean_arch/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
    this.userStateEntities,
    this.locationName,
  }) : super(key: key);

  final UserStateEntities? userStateEntities;
  final String? locationName;

  static Route route(
      {UserStateEntities? userStateEntities, String? locationName}) {
    return MaterialPageRoute<void>(
      builder: (_) => LoginPage(
          userStateEntities: userStateEntities, locationName: locationName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di<LoginCubit>(),
          ),
        ],
        child: _Body(
          userStateEntities: userStateEntities,
          locationName: locationName,
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, this.userStateEntities, this.locationName})
      : super(key: key);

  final UserStateEntities? userStateEntities;
  final String? locationName;

  @override
  Widget build(BuildContext context) {
    // switch (userStateEntities) {
    //   case UserStateEntities.loggedIn:
    //     return const HomePage();
    //   case UserStateEntities.priceChecker:
    //     return const HomePage();
    //   case UserStateEntities.cashier:
    //     return const HomePage();
    //   default:
    //     return const HomePage();
    // }
    return const LoginScreen();
  }
}
