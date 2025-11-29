import 'package:flutter/material.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';

class HeaderAppName extends StatelessWidget {
  const HeaderAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(width: 0, height: 16),
          Container(
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryColorBlue,
            ),
            padding: EdgeInsets.all(10),
            child: Icon(Icons.task_alt, color: Colors.white, size: 40),
          ),
          SizedBox(width: 0, height: 10),
          Text(
            "HandyTasksApp",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
