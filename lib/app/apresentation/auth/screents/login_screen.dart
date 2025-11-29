import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/bloc_maneger_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/event_login_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/data/bloc/state_login_bloc.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/signup_screen.dart';
import 'package:handytasksapp/app/apresentation/home/screens/home_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';
import 'package:handytasksapp/app/core/widgets/button_custom_widget.dart';
import 'package:handytasksapp/app/core/widgets/header_app_name.dart';
import 'package:handytasksapp/app/core/widgets/text_input_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColorDarkOne,
        body: SafeArea(
         child: BlocProvider(create: (_)=>BlocManegerBloc(),
         child: BlocConsumer<BlocManegerBloc, StateLoginBloc>(builder: (context,  state){
           if(state.loading == true){ 
             return Center(
               child:CircularProgressIndicator() ,
             );
            }
              return Form(
            key: _formkey,
            child: Column(
              children: [
                HeaderAppName(),
                SizedBox(height: 20),
                Text(
                  "Bem-vindo de volta!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "Faça login para continuar",
                  style: TextStyle(color: Colors.white38, fontSize: 16),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextInputWidget(
                    controller: _email,
                    hintText: 'exemplo@gmail.com',
                    type: keyBoardType.emailAddress,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextInputWidget(
                     controller: _password,
                    hintText: 'Palavra-passe',
                    type: keyBoardType.password,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,

                  child: Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: AppColors.primaryColorBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: ButtonCustomWidget(
                    text: "Entrar",
                    onpressed: () => {
                     context.read<BlocManegerBloc>().add(Login(email: _email.text.trim(), password: _password.text.trim()))
                    },
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Não tem uma conta?",
                        style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () => {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()))
                         },
                         child: Text(
                        "Criar conta",
                        style: TextStyle(
                          color: AppColors.primaryColorBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );

         }, listener: (context, state){}),
         
         )
        ),
      ),
    );
  }
}
