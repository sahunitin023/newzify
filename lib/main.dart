import 'package:flutter/material.dart';
import 'package:newzify/features/home/ui/screens/home.dart';

void main() async {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Newzify",
      home: const HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.dark(
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.grey.shade900,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.black,
          onBackground: Colors.white,
          surface: Colors.grey.shade900,
          onSurface: Colors.white,
        ),
      ),
    );
  }
}
