import 'package:flutter/material.dart';
import '../constants/constantsColor.dart';

Widget TextFiledCustom(Color?textFiedColor ,int maxLines, TextEditingController controller,String hint,TextInputType? keyboardTyp){
  return TextFormField(
    initialValue: hint,
    maxLines: maxLines,
    style: const TextStyle(color:black),
    onSaved: (value){
      controller.text=value!;
    },
    // controller: controller,
    validator:(value) {
      if (value==null ||value.isEmpty) {
        return 'filed ${hint} should be not empty !';
      }
      return null;
    },
    keyboardType:keyboardTyp ,
    decoration: InputDecoration(
       
      hintText: hint,
      hintStyle: TextStyle(color: black.withOpacity(0.4),fontSize: 16,fontFamily:"Josefin Sans"),
      filled: true,
      fillColor: textFiedColor,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
      ),
      enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
      ),
    ),
  );}

