import 'package:flutter/material.dart';
import 'package:tezbooks/home/home.dart';

void main() async {
  runApp(const TezBooksApp());
}

class TezBooksApp extends StatefulWidget {
  const TezBooksApp({super.key});

  @override
  State<TezBooksApp> createState() => _TezBooksAppState();
}

class _TezBooksAppState extends State<TezBooksApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
