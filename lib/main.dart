import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:read_news/pages/home.dart';

// costum color
Color costum = Color(0xFFFF6699);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}
