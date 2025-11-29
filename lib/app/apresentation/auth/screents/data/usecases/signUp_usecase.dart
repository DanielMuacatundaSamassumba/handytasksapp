
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_up_entities.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/repositories/auth_signup_repository.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

class SigninUsecase {
  final AuthSignupRepository authSignupRepository;
  SigninUsecase({required this.authSignupRepository});

  Future<HttpClientResponseModel> execute(SignUpEntities data) async {
    try {
      final response = await authSignupRepository.signUp(data);
      return response;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
