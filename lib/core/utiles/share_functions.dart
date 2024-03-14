import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateFormatting(String date){
  var list = date.split('-').map((e) => int.parse(e)).toList();
  String pattern = 'MMMM dd, yyyy';
  DateFormat dateformat = DateFormat(pattern);
  String formattedDate = dateformat.format(DateTime(list[0],list[1],list[2]));
  return formattedDate;
}


void navigatePushTo(Widget screen,context){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}