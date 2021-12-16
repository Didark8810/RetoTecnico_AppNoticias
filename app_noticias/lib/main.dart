import 'package:app_noticias/config/colors.dart';
import 'package:app_noticias/pages/tab_main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Main tab'),
            centerTitle: true,
            backgroundColor: colorAppBar(),
          ),
          body: const MainTab()),
    );
  }
}
