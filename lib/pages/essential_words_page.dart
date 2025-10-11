import 'package:flutter/material.dart';

class EssentialWordsPage extends StatefulWidget {
  const EssentialWordsPage({super.key});

  @override
  State<EssentialWordsPage> createState() => _EssentialWordsPageState();
}

class _EssentialWordsPageState extends State<EssentialWordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("کلمات ضروری", style: TextStyle(fontFamily: "dana")),
      ),
      body: Center(child: Text("Essentioal Words Page")),
    );
  }
}
