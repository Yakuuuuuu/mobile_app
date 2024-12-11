import 'package:batch33/view/card_view.dart';
// import 'package:batch33/view/snackbar_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardView(),
    );
  }
}
