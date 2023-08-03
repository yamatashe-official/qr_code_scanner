import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/main_qr_page.dart';
import '../pages/qr_generator_page.dart';
import '../providers/general_provider.dart';
import '../providers/modal_provider.dart';
import '../providers/qr_creator_provider.dart';

class PageLayoutCustom extends StatelessWidget {
  const PageLayoutCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        context.read<GeneralProvider>().updateCurrentPage = value;
        context.read<ModalProvider>().updateShowModal = false;
        context.read<ModalProvider>().data = null;
        context.read<ModalProvider>().scannedDate = null;
        context.read<QRCreatorProvider>().qrInputData = null;
      },
      children: const [
        MainQrPage(),
        QrGenerator(),
      ],
    );
  }
}
