// home_screen.dart
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:women_safety_app/utils/quotes.dart';
import 'package:women_safety_app/widgets/Custom_Carousel.dart';
import 'package:women_safety_app/widgets/LiveSafe.dart';
import 'package:women_safety_app/widgets/custom_appBar.dart';
import 'package:women_safety_app/widgets/home_widgets/emergency.dart';
// import 'package:women_safety_app/widgets/home_widgets/safehome/SafeHome.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int qIndex = 2;

  // Make qIndex a non-final field
  void getRandomQuote() {
    Random random = Random();

    setState(() {
      qIndex = random.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              quoteIndex: qIndex,
              onTap: getRandomQuote,
            ), // Use CustomAppBar as a widget here
            Custom_Carousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Emergency",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Emergency(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Explore LiveSafe",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            LiveSafe(),
            // SafeHome(),
          ],
        ),
      ),
    );
  }
}
