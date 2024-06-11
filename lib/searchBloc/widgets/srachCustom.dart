import 'package:flutter/material.dart';

import '../config/constant.dart';

Widget TextFiledSrarchCustom(String text,IconData iconData,IconData iconData2,Function(String)?func){

  return TextFormField(
    style: TextStyle(color:Color(0xFFE4E4E4)),
    autofocus: false,
    onChanged: func,
    decoration: InputDecoration(
      focusColor: Constant.TextFiledColor,
      prefixIcon: Icon(
        iconData,
        color:Color(0xFF55A99D),
      ),
      suffixIcon: Icon(
        iconData2,
        color: Colors.grey[800],
      ),
      hintText: text,
      hintStyle: TextStyle(
        color: Color(0xFFE4E4E4),
      ),
      filled: true,
      fillColor: Constant.TextFiledColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
      ),
    ),
  );
}