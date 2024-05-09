import 'package:age_pet/pages/IntroPage/intro_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idade do Pet',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const IntroPage(),
    );
  }
}

