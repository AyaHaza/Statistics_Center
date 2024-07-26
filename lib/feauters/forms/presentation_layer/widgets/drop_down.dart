import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/constants/contantsVarApp.dart';
import '../pages/add_form.dart';
import '../pages/edit_form.dart';

Widget DropDown(String text,TextEditingController controller,List items){
  return  DropdownButtonFormField2(
      decoration: InputDecoration(
        filled: true,
        fillColor: yellow.withOpacity(0.07),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: black.withOpacity(0.2),width: 1.4)
        ),
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      isExpanded: true,
      hint:  Text(
        text,
        style: TextStyle(fontSize: 14,color: black.withOpacity(0.7)),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 14,
              color: black
          ),
        ),
      )).toList(),
        onChanged: (value) {
          print(value);
          if(value=="gender"){
             valuT="gender";
          }else if(value=="study"){
             valuT="study";
          }
          // print(valuT);
          if(valuT=="gender"){
            valueNotifier.value=genderList;
            valueNotifierr.value=genderList;
          }else  if(valuT=="study"){
            valueNotifier.value=yourStudyList;
             valueNotifierr.value=yourStudyList;

          }else{valueNotifier.value=emptyList;valueNotifierr.value=emptyList;
}
        },
      onSaved: (value) {
        print("llllllllll  $value");
        controller.text = value!;
        },
        validator: (value) {
      if (value==null ||value.isEmpty) {
        return '     filed ${text} should be not empty !';
      }
      return null;
    },
      buttonStyleData: const ButtonStyleData(
        height: 56,
        padding: EdgeInsets.only(left: 20, right: 10),

      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: yellow,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
  );
}