class EventLoginBloc {
    final String email;
    final String password;
    const EventLoginBloc( {required this.email, required this.password});
}


class  Login extends EventLoginBloc {
  Login({required super.email, required super.password});
}