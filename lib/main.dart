import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layout/page_content_wrapper.dart';
import 'layout/page_layout_wrapper.dart';
import 'pages/error_page.dart';
import 'pages/main_qr_page.dart';
import 'pages/qr_generator_page.dart';
import 'providers/general_provider.dart';
import 'providers/modal_provider.dart';
import 'providers/qr_creator_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => ModalProvider()),
      ChangeNotifierProvider(create: (ctx) => GeneralProvider()),
      ChangeNotifierProvider(create: (ctx) => QRCreatorProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Qr Code Scanner",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageContentWrapper(child: PageLayoutCustom()),
      onGenerateRoute: generateRoute,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainQrPage.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PageContentWrapper(child: MainQrPage()),
        );
      case QrGenerator.routeName:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PageContentWrapper(child: QrGenerator()),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PageContentWrapper(child: ErrorPage()),
        );
    }
  }
}
