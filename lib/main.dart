import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'module/screen/from_main_page_screen/main_form_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormMainPage(),
    ),
  );
}
