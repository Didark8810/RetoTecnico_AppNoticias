import 'package:app_noticias/providers/estados_tabs.dart';
import 'package:app_noticias/widget/botton_nav_bar.dart';
import 'package:app_noticias/config/colors.dart';
import 'package:app_noticias/pages/tab_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EstadosNavTabs()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My News App'),
            centerTitle: true,
            backgroundColor: colorAppBar(),
          ),
          body: const MainTab(),
          bottomNavigationBar: const BottomNav(),
        ),
      ),
    );
  }
}
