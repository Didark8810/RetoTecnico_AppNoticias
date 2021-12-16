import 'package:flutter/widgets.dart';

class EstadosNavTabs with ChangeNotifier {
  int _currentTab = 0;
  final PageController _pageController = PageController();

  int get currentTab => _currentTab;
  PageController get pageController => _pageController;

  set currentTab(int index) {
    _currentTab = index;
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    notifyListeners();
  }
}
