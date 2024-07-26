import 'package:flutter/material.dart';
import '../../../../core/constants/constantsColor.dart';
import '../../../../core/widgetsApp/TextFiledCustom.dart';
import 'drop_down.dart';

Widget Field(String name, TextEditingController controller,
    TextInputType? textInputType) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(name),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextFiledCustom(
                yellow.withOpacity(0.06), 1, controller, "", textInputType),
          ),
        ),
      ],
    ),
  );
}

Widget FieldWithDropDown(
    String name, TextEditingController controller, List<dynamic> items) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(name),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: DropDown("", controller, items))),
      ],
    ),
  );
}
