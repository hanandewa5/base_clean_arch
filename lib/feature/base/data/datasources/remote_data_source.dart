import 'dart:convert';

import 'package:base_clean_arch/feature/base/data/services/api_service.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_entities.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';

class RemoteDataSource {
  final ApiService service;

  RemoteDataSource({required this.service});

  //#region FUNCTION

  Future<LoginEntities> loginUser(LoginParam loginParam, {int? closureId}) async {
    final String response = await service.loginUser(loginParam);
    final LoginEntities loginEntities = LoginEntities.fromJson(jsonDecode(response));
    return loginEntities;
  }

  //#endregion
}
