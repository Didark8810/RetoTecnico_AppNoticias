import 'package:app_noticias/providers/estados_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BodyMainTab();
  }
}

class BodyMainTab extends StatelessWidget {
  const BodyMainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionTab = Provider.of<EstadosNavTabs>(context);
    return PageView(
      controller: navegacionTab.pageController,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(color: Colors.orange),
      ],
    );
  }
}
