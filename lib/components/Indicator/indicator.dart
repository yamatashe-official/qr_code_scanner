import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../globals/colors.dart';
import '../../providers/general_provider.dart';

class Indicator extends StatelessWidget with AppColors {
  Indicator({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.2,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 0; i < 2; i++)
            LayoutBuilder(
              builder: (context, constraints) => Consumer<GeneralProvider>(
                builder: (context, gp, child) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: constraints.maxHeight * 0.5,
                  decoration: BoxDecoration(
                    color: gp.currentPage == i ? black : black.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
