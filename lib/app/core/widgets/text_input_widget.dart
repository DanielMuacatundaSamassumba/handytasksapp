import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handytasksapp/app/core/colors/colors.dart';

enum keyBoardType { text, phone, emailAddress, password, textarea, date }

class TextInputWidget extends StatefulWidget {
  final String? hintText;
  final keyBoardType type;
  final TextEditingController controller;
  final bool iconIsvisible;
  const TextInputWidget({
    super.key,
    required this.hintText,
    required this.type,
    required this.controller,
    this.iconIsvisible = false,
  });

  @override
  State<TextInputWidget> createState() => _TextInputWidget();
}

class _TextInputWidget extends State<TextInputWidget> {
  bool isVisible = true;
  void ShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      keyBoardType.emailAddress => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryColorDarkTwo),
          borderRadius: BorderRadius.circular(5),
        ),

        child: Row(
          children: [
            SizedBox(width: 5),
            Container(child: Icon(Icons.mail, color: Colors.grey)),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: this.widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  focusColor: AppColors.primaryColorDarkTwo,
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      keyBoardType.phone => TextField(
        controller: this.widget.controller,

        keyboardType: TextInputType.phone,
      ),
      keyBoardType.text => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(
              child: widget.iconIsvisible
                  ? Icon(Icons.person, color: Colors.grey)
                  : Text(""),
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: this.widget.controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  focusColor: AppColors.primaryColorDarkTwo,
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      keyBoardType.password => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.primaryColorDarkTwo),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Container(child: Icon(Icons.lock, color: Colors.grey)),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: this.widget.controller,
                obscureText: isVisible,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,

                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () => {ShowPassword()},
                icon: isVisible
                    ? Icon(Icons.visibility, color: Colors.grey)
                    : Icon(Icons.visibility_off, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      keyBoardType.textarea => Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: this.widget.controller,
                maxLines: 10987654345678,
                keyboardType: TextInputType.twitter,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      keyBoardType.date => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: this.widget.controller,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    };
  }
}
