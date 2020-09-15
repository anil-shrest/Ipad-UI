import 'package:flutter/material.dart';
import 'package:ipad_v1/pages/login.dart';
import 'package:flutter/foundation.dart';
import 'package:ipad_v1/provider/provider_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderModel()),
    ],
    child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => ProviderModel(),
          child: MaterialApp(
        color: Colors.white,
        home: LoginScreen(),
      ),
    );
  }
}
