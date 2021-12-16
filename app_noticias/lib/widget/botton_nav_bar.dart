import 'package:app_noticias/providers/estados_tabs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bitcoin), label: "Economia"),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cameraRetro), label: "Social"),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.globeAmericas), label: "General"),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heartbeat), label: "Salud"),
        BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.atom), label: "Ciencia"),
      ],
    );
  }
}
