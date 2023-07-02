import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/pages/dashboard.dart';

void main(){
  runApp(MaterialApp(
    home: DashBoard() ,
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,));
}