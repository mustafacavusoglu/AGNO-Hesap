import 'package:flutter/material.dart';

class DecorationConst {
  static DecorationConst _instance = DecorationConst._init();
  static DecorationConst get instance => _instance;
  DecorationConst._init();

  static final InputDecoration dersDecoration = InputDecoration(
      icon: Icon(Icons.auto_stories,color: Colors.blue.shade900,),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      labelText: "Ders Adını Giriniz",
      hintText: "Lütfen Ders Adını Giriniz...",
      border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(50)
      ));
}
