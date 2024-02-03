import 'package:coffee_shop/pages/pages.dart';
import 'package:coffee_shop/theme/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerTheme: const DividerThemeData(color: kBlackAlt),
        colorSchemeSeed: kPrimary,
        scaffoldBackgroundColor: kHomeBackground,
        fontFamily: 'Sora',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: kBlackAlt),
        ),
      ).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              surfaceVariant: Colors.transparent,
            ),
      ),
      home: const OnBoardPage(),
    );
  }
}
