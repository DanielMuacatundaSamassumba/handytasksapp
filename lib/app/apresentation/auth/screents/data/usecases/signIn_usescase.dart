import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_in_entinties.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/repositories/auth_signin_repository.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

class SigninUsescase {
  final AuthSigninRepository authSigninRepository;
  SigninUsescase({required this.authSigninRepository});

  Future<HttpClientResponse> execute(SignInEntinty data) async {
    final response = authSigninRepository.signIn(data);
    return response;
  }
}
