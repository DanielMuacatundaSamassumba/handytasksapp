

import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_up_entities.dart';
import 'package:handytasksapp/app/core/network/http_client_response.dart';

abstract  interface class AuthSignupRepository {
   Future<HttpClientResponse>  signUp(SignUpEntities data );
 }
