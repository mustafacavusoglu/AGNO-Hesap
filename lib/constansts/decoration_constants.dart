import 'package:flutter/material.dart';

class DecorationConst {
  static DecorationConst _instance = DecorationConst._init();
  static DecorationConst get instance => _instance;
  DecorationConst._init();

  static final InputDecoration dersDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(50),
    ),
    icon: Icon(
      Icons.auto_stories,
      color: Colors.blue.shade900,
    ),
    labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
    labelText: "Ders Adını Giriniz",
    hintText: "Lütfen Ders Adını Giriniz...",
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white54),
      borderRadius: BorderRadius.circular(50),
    ),
  );

  static List<DropdownMenuItem<int>> krediItems() {
    List<DropdownMenuItem<int>> items = [];

    for (int i = 0; i < 15; i++) {
      DropdownMenuItem<int> item = DropdownMenuItem<int>(
        value: i,
        child: Text("$i kredi"),
      );
      items.add(item);
    }
    return items;
  }

  static List<DropdownMenuItem<double>> harfNotItems() {
    List<DropdownMenuItem<double>> items = [];

    List<String> harfler = [
      "AA",
      "BA",
      "BB",
      "CB",
      "CC",
      "DC",
      "DD",
      "FD",
      "FF"
    ];
    List<double> harfDegerleri = [4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.5, 0.0];

    for (int i = 0; i < 9; i++) {
      items.add(
        DropdownMenuItem<double>(
          child: Text("${harfler[i]}"),
          value: harfDegerleri[i],
        ),
      );
    }

    return items;
  }
}
