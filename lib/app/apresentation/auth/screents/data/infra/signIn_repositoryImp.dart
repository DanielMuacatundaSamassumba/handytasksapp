import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_in_entinties.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/repositories/auth_signin_repository.dart';
import 'package:handytasksapp/app/core/env/Env.dart';
import 'package:handytasksapp/app/core/interface/http_client_repository.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

class SigninRepositoryimpl implements AuthSigninRepository {
  final HttpClientRepository httpClientRepository;
  SigninRepositoryimpl({required this.httpClientRepository});
  @override
  Future<HttpClientResponse> signIn(SignInEntinty data) async {
    final response = await httpClientRepository.post(
      '${Env.base_url}/auth/login',
      body: data.toJson(),
    );
    return response;
  }
}
