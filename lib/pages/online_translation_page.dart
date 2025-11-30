import 'package:flutter/material.dart';
import 'package:hello_trip/components/program.dart';

class OnlineTranslationPage extends StatefulWidget {
  const OnlineTranslationPage({super.key});

  @override
  State<OnlineTranslationPage> createState() => _OnlineTranslationPageState();
}

class _OnlineTranslationPageState extends State<OnlineTranslationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          program.WordsList[4][program.OrginLang],
          style: TextStyle(fontFamily: "dana"),
        ),
      ),
      body: Center(child: Text("Frequently Used Terms Page")),
    );
  }
}
