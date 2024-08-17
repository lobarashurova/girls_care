import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainAppDbService extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  int get currentIndex => _currentIndex;
  bool get isVisible => _isVisible;
  ScrollController get scrollController => _scrollController;

  MainAppDbService() {
    _scrollController.addListener(handleScroll);
  }

  void onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateVisibility(bool isVisible) {
    _isVisible = isVisible;
    notifyListeners();
  }

  void handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        updateVisibility(true);
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        updateVisibility(false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}