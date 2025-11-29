import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/event_login_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/state_login_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/domain/entities/sign_in_entinties.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/infra/signIn_repositoryImp.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/usecases/signIn_usescase.dart';
import 'package:handytasksapp/app/core/network/dio_http_custom.dart';

class BlocManegerBloc extends Bloc<EventLoginBloc, StateLoginBloc> {
  final dio = Dio();
  BlocManegerBloc() : super(StateLoginBloc(loading: false)) {
    on<Login>((event, omit) async {
      omit(StateLoginBloc(loading: true));
      try {
        final dioCustumHttpClient = DioHttpCustom(dioCustomhttpClient: dio);
        final sigInRepositoryImpl = SigninRepositoryimpl(
          httpClientRepository: dioCustumHttpClient,
        );
        final sigInUsecase = SigninUsescase(
          authSigninRepository: sigInRepositoryImpl,
        );
        final data = SignInEntinty(
          email: event.email,
          password: event.password,
        );
        final response = await sigInUsecase.execute(data);
        print(response.body);

        omit(StateLoginBloc(failed: false, success: true, loading: false));
      } on DioException catch (e) {
        print("Algo deu errado! ${e.message}");
        omit(StateLoginBloc(loading: false));
      }
    });
  }
}
