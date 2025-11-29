class SignEventBlc {
  final String email;
  final String name;
  final String password;
  final String confPassword;

  SignEventBlc({
    required this.email,
    required this.name,
    required this.password,
    required this.confPassword,
  });
}

class SignIn extends SignEventBlc{
  SignIn({required super.email, required super.name, required super.password, required super.confPassword});
}