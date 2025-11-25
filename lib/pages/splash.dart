import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_trip/components/program.dart';
import 'package:hello_trip/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  Future<void> initApp() async {
    await loadSharedPhrefences();
    await loadJsonDataEssential();
    await loadJsonDataTerms();

    print("=== All Loaded === ");

    // Future.delayed(const Duration(milliseconds: 3000), () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage(selectedIndex: 2)),
    );
    // });
  }

  Future<void> loadSharedPhrefences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final orginLanguage = prefs.getString("orgin_lang") ?? "fa";
    final accountName = prefs.getString("account_name") ?? "Unknown";
    final targetLanguage = prefs.getString("target_lang") ?? "en";
    setState(() {
      // ignore: unused_local_variable
      program.OrginLang = orginLanguage;
      program.name = accountName;
      program.TargetLang = targetLanguage;
    });
  }

  Future<void> loadJsonDataEssential() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/essential.json',
    );
    var data = jsonDecode(jsonString);

    setState(() {
      program.DataEssential = data;
    });
  }

  Future<void> loadJsonDataTerms() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/terms.json',
    );
    var data = jsonDecode(jsonString);

    setState(() {
      program.DataTerms = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          SvgPicture.asset("assets/images/flag.svg"),
          SizedBox(height: 20),
          Text(
            "Trip Phrases",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 92, 96, 97),
              fontFamily: "dana",
            ),
          ),
          Spacer(),
          SvgPicture.asset("assets/images/travelsplash.svg", width: 500),
        ],
      ),
    );
  }
}
