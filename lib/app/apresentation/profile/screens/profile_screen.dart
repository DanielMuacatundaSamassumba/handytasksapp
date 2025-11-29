import 'package:flutter/material.dart';
import 'package:handytasksapp/app/apresentation/auth/screents/login_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';
import 'package:handytasksapp/app/core/constants/images.dart';
import 'package:handytasksapp/app/core/widgets/header_app_name.dart';
import 'package:handytasksapp/app/core/widgets/header_custom_wigdget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorDarkTwo,
      body: SafeArea(
        child: Column(
          children: [
            HeaderCustomWigdget(),
            SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 4, color: AppColors.primaryColorBlue),
              ),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "Nome",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,

                      child: Text(
                        "Daniel Samassumba",

                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 0),

                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,

                      child: Text(
                        "danielsamassumba@gmail.com",

                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 0),
              ],
            ),

   
            Row(
            
              children: [
                SizedBox(width: 20,), Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "Tarefas",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,

                      child: Text(
                        "10",

                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
              SizedBox(height: 300,),

              Container(
                 child: Text("Editar Perfil",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600), ),
              ),
                 SizedBox(height: 4,),
               Container(
                 child: InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                   child: Text("Sair", style: TextStyle(color: AppColors.primaryColorBlue,  fontWeight: FontWeight.w600),),
                 ),
              )
          ],
        ),
      ),
    );
  }
}
