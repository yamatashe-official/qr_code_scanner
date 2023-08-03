import 'package:flutter/material.dart';

class QRCreatorProvider extends ChangeNotifier {
  String? qrData, qrInputData;

  //update the qrInputData -> using this instead of a text controller so that the qr generator can be accessed everywhere
  set updateInputData(String? newData) {
    qrInputData = newData;
    notifyListeners();
  }
}
