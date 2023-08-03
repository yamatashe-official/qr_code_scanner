import 'package:flutter/material.dart';

class GeneralProvider extends ChangeNotifier {
  int currentPage = 0;

  //determine what page that is current being shown and to update UI as needed
  set updateCurrentPage(int newPageInt) {
    currentPage = newPageInt;
    notifyListeners();
  }
}
