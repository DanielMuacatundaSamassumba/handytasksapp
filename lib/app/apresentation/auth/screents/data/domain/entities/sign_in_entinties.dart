class SignInEntinty {
  final String email;
  final String password;
  SignInEntinty({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
