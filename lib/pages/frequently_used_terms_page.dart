import 'package:flutter/material.dart';

class FrequentlyUsedTermsPage extends StatefulWidget {
  const FrequentlyUsedTermsPage({super.key});

  @override
  State<FrequentlyUsedTermsPage> createState() =>
      _FrequentlyUsedTermsPageState();
}

class _FrequentlyUsedTermsPageState extends State<FrequentlyUsedTermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اصطلاحات پرکاربرد", style: TextStyle(fontFamily: "dana")),
      ),
      body: Center(child: Text("Frequently Used Terms Page")),
    );
  }
}
