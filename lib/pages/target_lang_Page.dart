import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_trip/components/program.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TargetLangPage extends StatefulWidget {
  const TargetLangPage({super.key});

  @override
  State<TargetLangPage> createState() => _TargetLangPageState();
}

class _TargetLangPageState extends State<TargetLangPage> {
  List<Map<String, dynamic>> LanguagesTarget = [
    {
      "Lang": "Turkey",
      "imgAddress": "assets/images/turkey.png",
      "langShort": "tr",
    },
    {
      "Lang": "France",
      "imgAddress": "assets/images/france.png",
      "langShort": "fr",
    },
    {
      "Lang": "English",
      "imgAddress": "assets/images/english.jpg",
      "langShort": "en",
    },
    {
      "Lang": "China",
      "imgAddress": "assets/images/china.png",
      "langShort": "zh",
    },
    {
      "Lang": "Russia",
      "imgAddress": "assets/images/russia.png",
      "langShort": "ru",
    },
    {
      "Lang": "العربیه",
      "imgAddress": "assets/images/arabic.png",
      "langShort": "ar",
    },
    {
      "Lang": "Japan",
      "imgAddress": "assets/images/japan.png",
      "langShort": "ja",
    },
    {
      "Lang": "Spain",
      "imgAddress": "assets/images/spain.png",
      "langShort": "es",
    },
    {
      "Lang": "Germany",
      "imgAddress": "assets/images/germany.png",
      "langShort": "de",
    },
  ];

  Future<void> setTargetLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      program.TargetLang = lang;
    });
    await prefs.setString('target_lang', lang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      appBar: AppBar(
        title: Text(
          program.WordsList[6][program.OrginLang],
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_rounded, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],

        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          //
          SizedBox(height: 30),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () {
                    setTargetLang(LanguagesTarget[index]["langShort"]);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 3,
                      horizontal: 0,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            LanguagesTarget[index]["imgAddress"],
                            width: double.infinity,
                            height: 60,
                          ),
                          Spacer(),
                          Text(
                            LanguagesTarget[index]["Lang"],
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          //
          Container(
            width: double.infinity,
            height: 280,
            child: SvgPicture.asset(
              "assets/images/travelsplash.svg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
