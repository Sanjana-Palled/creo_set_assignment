import 'package:flutter/material.dart';
import 'package:assignment/news_page.dart';
import 'package:assignment/login.dart';
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        '/newspage': (context) => const NewsPage(),
      }
  ));
}
