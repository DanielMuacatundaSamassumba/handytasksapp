import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handytasksapp/app/apresentation/task/screens/add_task_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';
import 'package:handytasksapp/app/core/widgets/header_custom_wigdget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorDarkTwo,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
             child: Column(
            children: [
              HeaderCustomWigdget(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  AppColors.primaryColorDarkOne

                ),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(15),
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Vou ser o  Melhor dev de Angola!",
                  style: TextStyle(color: Colors.white,  ),
                ),
              ),

              
            ],
          ),
          ),
          
           
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()))
        },
        backgroundColor: AppColors.primaryColorBlue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
