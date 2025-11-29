import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/sign_event_blc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/sign_state_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_up_entities.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/infra/signUp_repositoryImpl.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/usecases/signUp_usecase.dart';
import 'package:handytasksapp/app/core/network/dio_http_custom.dart';

class SignManegerBloc extends Bloc<SignEventBlc, SignStateBloc> {
  final dio = Dio(BaseOptions( headers: {
    "Accept": "application/json",
    "Content-Type": "application/json",
  },));
  SignManegerBloc()
    : super(
        SignStateBloc(
          loading: false,
          isFailed: false,
          isSucess: false,
          massesge: "",
        ),
      ) {
    on<SignIn>((event, omit) async {
      omit(
        SignStateBloc(
          loading: true,
          isFailed: false,
          isSucess: false,
          massesge: "",
        ),
      );
      try {
            final  httpdioCustom = DioHttpCustom(dioCustomhttpClient: dio);
           final authSignUpRepositoryIml = SignupRepositoryimpl(httpClient:  httpdioCustom);
             final authSignUpUseCase = SigninUsecase(authSignupRepository: authSignUpRepositoryIml);
              /*final Object data ={
                 "name":event.name,
                 "email":event.email,
                 "password":event.password
               } */
                 final data = SignUpEntities(email: event.email, name: event.name, password: event.password);
              final response = await authSignUpUseCase.execute(data);
                print(response.body);
                omit(
        SignStateBloc(
          loading: false,
          isFailed: false,
          isSucess: true,
          massesge: "",
        ),
      );

      } on DioException catch (e) {
        if (e.response != null) {
          print('Erro HTTP:${e.response?.statusCode}');
          print('Mensagem: ${e.response}');
          omit(
        SignStateBloc(
          loading: false,
          isFailed: false,
          isSucess: false,
          massesge: "",
        ),
      );
        } else {
          print('Erro de conexão:${e}');
          omit(
        SignStateBloc(
          loading: false,
          isFailed: false,
          isSucess: false,
          massesge: "",
        ),
      );
        }
      }
    });
  }
}
