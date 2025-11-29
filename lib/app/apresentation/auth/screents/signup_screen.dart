import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/sign_event_blc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/sign_maneger_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/sign_state_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/login_screen.dart';
import 'package:handytasksapp/app/apresentation/home/screens/home_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';
import 'package:handytasksapp/app/core/widgets/button_custom_widget.dart';
import 'package:handytasksapp/app/core/widgets/header_app_name.dart';
import 'package:handytasksapp/app/core/widgets/text_input_widget.dart';

class SignupScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confPassword = TextEditingController();
  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorDarkOne,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => SignManegerBloc(),
          child: BlocConsumer<SignManegerBloc, SignStateBloc>(
            builder: (context, state) {
              if (state.loading == true) {
                return Center(child: CircularProgressIndicator());
              }
              if (state.isSucess == true) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Cadastro realizado com sucesso!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                });

                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              }

              return Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onTap: () => {
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              ),
                            },
                          ),
                        ),
                        HeaderAppName(),
                        Text(
                          "Crie a sua Conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Bem-vindo! Crie sua conta para começar a organizar suas tarefas",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Nome",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextInputWidget(
                                hintText: "Nome",
                                type: keyBoardType.text,
                                controller: _name,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextInputWidget(
                                hintText: "exemplo@gmail.com",
                                type: keyBoardType.emailAddress,
                                controller: _email,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Palavra-passe",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextInputWidget(
                                hintText: "**************",
                                type: keyBoardType.password,
                                controller: _password,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "Confirme a  sua palavra-passe",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 5),
                              TextInputWidget(
                                hintText: "***********",
                                type: keyBoardType.password,
                                controller: _confPassword,
                              ),
                              SizedBox(height: 12),
                              Container(
                                child: ButtonCustomWidget(
                                  text: "Criar Conta",
                                  onpressed: () => {
                                    context.read<SignManegerBloc>().add(
                                      SignIn(
                                        email: _email.text.trim(),
                                        name: _name.text.trim(),
                                        password: _password.text.trim(),
                                        confPassword: _confPassword.text.trim(),
                                      ),
                                    ),
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            listener: (context, state) => {},
          ),
        ),
      ),
    );
  }
}
