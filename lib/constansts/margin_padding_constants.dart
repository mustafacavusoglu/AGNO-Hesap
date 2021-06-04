import 'package:flutter/material.dart';
class MarginPadding{


  static MarginPadding _instance = MarginPadding._init();
  static MarginPadding get instance => _instance;
  MarginPadding._init();

  static final  EdgeInsets margin = EdgeInsets.all(12);
  static final  EdgeInsets padding = EdgeInsets.all(12);
  // ignore: non_constant_identifier_names
}