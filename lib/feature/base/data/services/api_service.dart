import 'package:base_clean_arch/core/services/base_api_client.dart';
import 'package:base_clean_arch/feature/base/data/services/api_url.dart';
import 'package:base_clean_arch/feature/base/domain/entities/login/login_params.dart';

class ApiService {
  final BaseApiClient apiClient;

  ApiService({required this.apiClient});

  //#region FUNCTION

  Future<String> loginUser(LoginParam loginParam) {
    final Map<String, dynamic> jsonBody = {
      'email': loginParam.email,
      'password': loginParam.password,
    };

    return apiClient.post(pathUrl: ApiUrl.urlLogin, jsonBody: jsonBody);
  }

  //#endregion

}
