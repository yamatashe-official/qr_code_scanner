import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/colors.dart';
import '../../providers/modal_provider.dart';
import 'DateScanned/date_scanned.dart';
import 'DisplayData/display_data.dart';
import 'TextData/text_data.dart';

class BottomModalCustom extends StatefulWidget {
  const BottomModalCustom({
    super.key,
    this.data,
    this.description,
    required this.size,
    this.timeScanned,
    this.title,
  });

  final Size size;
  final String? title;
  final String? description;
  final String? data;
  final DateTime? timeScanned;

  @override
  State<BottomModalCustom> createState() => _BottomModalCustomState();
}

class _BottomModalCustomState extends State<BottomModalCustom> with AppColors {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModalProvider>(
      builder: (context, mp, child) => GestureDetector(
        onTap: () => mp.updateShowModal = false,
        child: Visibility(
          visible: mp.showModal,
          child: Container(
            // color: Colors.green, // switch this out to new modal color
            color: white,
            width: widget.size.width,
            height: widget.size.height * 0.4,
            child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: const EdgeInsets.all(25),
                child: Stack(
                  children: [
                    TextData(
                      title: mp.title ?? "Scanned Data",
                      description: mp.description ?? "Check out what was scanned.",
                    ),
                    Align(
                        child: DisplayData(
                      constraints: constraints,
                      data: mp.data,
                    )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: DateScanned(
                        scannedDate: mp.scannedDate,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
