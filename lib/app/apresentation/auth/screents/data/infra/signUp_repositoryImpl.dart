import 'dart:io';

import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_up_entities.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/repositories/auth_signup_repository.dart';
import 'package:handytasksapp/app/core/env/Env.dart';
import 'package:handytasksapp/app/core/interface/http_client_repository.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

class SignupRepositoryimpl implements AuthSignupRepository {
  final HttpClientRepository httpClient;
  SignupRepositoryimpl({required this.httpClient});
  @override
  Future<HttpClientResponse> signUp(SignUpEntities data) async {
    final response = await httpClient.post(
      '${Env.base_url}/auth/register',
      body: {"name": data.name, "email": data.email, "password": data.password},
    );

    return response;
  }
}
