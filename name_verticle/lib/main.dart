import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:name_verticle/Pages/home_page.dart';
import 'package:name_verticle/Provider/text_list_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TextProvider(),
        ),
      ],
    );

    return ChangeNotifierProvider(
      create: (context) => TextProvider(),
      child: MaterialApp(
        title: "Rotate Text",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: const Color.fromARGB(102, 230, 5, 5),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: "Rotate Text"),
      ),
    );
  }
}

