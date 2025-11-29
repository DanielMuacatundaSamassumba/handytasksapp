import 'package:flutter/material.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';

class ButtonCustomWidget extends StatelessWidget {
    final String  text;
    final void Function()? onpressed;
    const ButtonCustomWidget({super.key, required this.text,  required this.onpressed});

      Widget build(BuildContext context) {
        return Container(
             width: MediaQuery.of(context).size.width * 0.9,
             padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
               color: AppColors.primaryColorBlue,
                borderRadius: BorderRadius.circular(10)
            ),
           child: TextButton(onPressed:onpressed, child: Text(text, style: TextStyle( color: Colors.white, fontWeight: FontWeight.w600), ), style: ButtonStyle(
 
           ),),
        );
      }
}