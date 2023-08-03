import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../providers/modal_provider.dart';

class MainQrPage extends StatefulWidget {
  const MainQrPage({super.key});

  static const String routeName = '/';

  @override
  State<MainQrPage> createState() => _MainQrPageState();
}

class _MainQrPageState extends State<MainQrPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR Scanner");
  MobileScannerController? controller = MobileScannerController();

  @override
  void dispose() {
    print("controller disposed");
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ModalProvider>(
        builder: (context, mp, child) => MobileScanner(
          controller: controller,
          onDetect: (capt) {
            String? data = capt.barcodes.first.rawValue;
            print(data);
            if (data != null) {
              mp.showModal = true;
              mp.updateScannedDate = DateTime.now();
              mp.updateData = data;
            }
          },
        ),
      ),
    );
  }
}
