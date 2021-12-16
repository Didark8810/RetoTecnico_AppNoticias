import 'package:app_noticias/providers/estados_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionTab = Provider.of<EstadosNavTabs>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navegacionTab.currentTab,
      onTap: (i) => navegacionTab.currentTab = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Bussiness"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Entretai"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "General"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Health"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Scienc"),
      ],
    );
  }
}
