import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScanned extends StatelessWidget {
  const DateScanned({
    super.key,
    this.scannedDate,
  });

  final DateTime? scannedDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Last Scanned: ${DateFormat.jms().format(scannedDate ?? DateTime.now())}",
      style: const TextStyle(fontSize: 10),
    );
  }
}
