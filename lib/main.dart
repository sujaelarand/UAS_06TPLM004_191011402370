import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas_06tplm006_cuaca/provider/provider_cuaca.dart';
import 'package:uas_06tplm006_cuaca/screen/screen_cuaca.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CuacaProvider>(
          create: (context) => CuacaProvider(),
        ),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
