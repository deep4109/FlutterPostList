import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_posts_list/view/home_screen.dart';

import 'di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  HttpOverrides.global = MyHttpOverrides();
  initDio();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
