import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handytasksapp/app/apresentation/profile/screens/profile_screen.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';

class HeaderCustomWigdget extends StatelessWidget {
  const HeaderCustomWigdget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColorDarkOne,
        border: Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.task_alt,
                  color: AppColors.primaryColorBlue,
                  size: 40,
                ),
                SizedBox(width: 5),
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
          ),
          InkWell(
             onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
             },
             child:  Icon(Icons.person, color: Colors.white,),
          )
        ],
      ),
    );
  }
}
