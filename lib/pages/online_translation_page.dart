import 'package:flutter/material.dart';

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
        title: Text("ترجمه آنلاین", style: TextStyle(fontFamily: "dana")),
      ),
      body: Center(child: Text("Frequently Used Terms Page")),
    );
  }
}
