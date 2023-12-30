//1. Material Design -- created by google
import 'package:flutter/material.dart';
import 'package:currency_converter/currency_converter_material_page.dart';
//2. Cupertino Design -- created by apple
import 'package:flutter/cupertino.dart';
import 'package:currency_converter/currency_converter_cupertinao_page.dart';

void main() {
  runApp(const MyCupertinoApp());
}

//Types of widgets
//1. StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CurrencyConverterMaterialPage());
  }
}

//2. StatefulWidget
class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}

//3. InheritedWidget

//Buttons :-
//raised
//appears like a text0