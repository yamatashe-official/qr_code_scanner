import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/BottomModal/bottom_modal_custom.dart';
import '../components/Indicator/indicator.dart';
import '../globals/colors.dart';
import '../providers/general_provider.dart';

class PageContentWrapper extends StatefulWidget {
  const PageContentWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PageContentWrapper> createState() => _PageContentWrapperState();
}

class _PageContentWrapperState extends State<PageContentWrapper> with AppColors {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Consumer<GeneralProvider>(
          builder: (context, gp, child) => Text(
            gp.currentPage == 0
                ? "Scan A QR Code"
                : gp.currentPage == 1
                    ? "Generate A QR Code"
                    : "ERROR",
            style: TextStyle(color: white),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          widget.child,
          Positioned(bottom: 0, child: BottomModalCustom(size: size)),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Align(child: Indicator(size: size)),
          ),
        ],
      ),
    );
  }
}
