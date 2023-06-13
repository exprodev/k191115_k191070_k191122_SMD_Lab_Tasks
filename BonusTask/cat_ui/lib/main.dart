import 'package:flutter/material.dart';
import 'package:cat_ui/my_home_page.dart';
import 'package:provider/provider.dart';
import 'package:cat_ui/profile_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProfileModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cat App',
      home: MyHomePage(),
    );
  }
}