import 'package:flutter/material.dart';
import 'package:quotes_app_2pm/screens/homescreen.dart';

void main()
{
  runApp(
    const QuotesApp()
  );
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/' : (context) => HomeScreen(),
      },
    );
  }
}