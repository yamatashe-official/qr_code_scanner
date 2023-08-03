import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../providers/qr_creator_provider.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({super.key});

  static const String routeName = '/qr-generator';

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  final TextEditingController textController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Start by entering something in the text box."),
                    const SizedBox(height: 10),
                    Consumer<QRCreatorProvider>(
                      builder: (context, qrcp, child) => TextField(
                        controller: textController,
                        onChanged: (val) {
                          if (val == "") {
                            qrcp.updateInputData = null;
                          } else {
                            qrcp.updateInputData = val;
                          }
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter something here...",
                          suffixIcon: IconButton(
                              onPressed: () {
                                qrcp.updateInputData = null;
                                textController.text = "";
                              },
                              icon: const Icon(Icons.clear)),
                        ),
                      ),
                    ), // style this lol
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 4,
                  child: Consumer<QRCreatorProvider>(
                    builder: (context, qrcp, child) => Container(
                      width: size.width,
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: qrcp.qrInputData != null
                          ? QrImageView(data: qrcp.qrInputData!)
                          : const Center(child: AutoSizeText("Convert something to a QR code.")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
