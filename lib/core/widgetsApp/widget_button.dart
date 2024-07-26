import 'package:flutter/material.dart';

Widget ButtonCustom(double width, double height,Widget widget,Color buttonColor,Color textColor,Function()?function){
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(top: 40,bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 4.4,
            backgroundColor: buttonColor,
            fixedSize: Size(width, height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: function,
        child: widget

      ),
    ),
  );
}

