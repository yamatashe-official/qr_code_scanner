import 'package:flutter/material.dart';

class ModalProvider with ChangeNotifier {
  String? title, description, data;
  DateTime? scannedDate;
  bool showModal = false;

  //update the title variable - for popup modal
  set updateTitle(String? newTitle) {
    title = newTitle;
    notifyListeners();
  }

  //update the description variable - for popup modal
  set updateDescription(String? newDesc) {
    description = newDesc;
    notifyListeners();
  }

  //update scannedDate variable - for popup modal
  set updateScannedDate(DateTime newDate) {
    scannedDate = newDate;
    notifyListeners();
  }

  //whether to show the modal or not
  set updateShowModal(bool value) {
    showModal = value;
    notifyListeners();
  }

  //update the output data that is shown from the qr scanner package - for popup modal
  set updateData(String newData) {
    data = newData;
    notifyListeners();
  }
}
