import 'package:bytecrm_form/module/screen/users_card_screen/users_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserCards(),
    ),
  );
}
