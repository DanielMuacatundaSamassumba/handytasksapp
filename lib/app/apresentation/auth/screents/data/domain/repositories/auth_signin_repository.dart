import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_in_entinties.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

abstract interface class AuthSigninRepository {
  Future<HttpClientResponse> signIn(SignInEntinty data);
}
