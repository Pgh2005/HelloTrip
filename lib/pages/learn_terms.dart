import 'package:flutter/material.dart';
import 'package:hello_trip/pages/home_page.dart';

class LearnTerms extends StatefulWidget {
  final String title;
  final int index;
  const LearnTerms({super.key, required this.title, required this.index});

  @override
  State<LearnTerms> createState() => _LearnTermsState();
}

class _LearnTermsState extends State<LearnTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: "dana")),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
    );
  }
}
