import 'package:flutter/material.dart';

class DecorationConst {
  static DecorationConst _instance = DecorationConst._init();
  static DecorationConst get instance => _instance;
  DecorationConst._init();

  static final InputDecoration dersDecoration = InputDecoration(
      labelText: "Ders Adını Giriniz",
      hintText: "Lütfen Ders Adını Giriniz...",
      border: OutlineInputBorder());
}
