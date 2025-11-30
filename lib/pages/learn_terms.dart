import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hello_trip/components/program.dart';
import 'package:hello_trip/pages/home_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LearnTerms extends StatefulWidget {
  final String title;
  final int index;
  const LearnTerms({super.key, required this.title, required this.index});

  @override
  State<LearnTerms> createState() => _LearnTermsState();
}

class _LearnTermsState extends State<LearnTerms> {
  var jsonData;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    jsonData = program.DataTerms["data"][widget.index];
    setTTS();
    _initTts();
  }

  void setTTS() {
    String TTSLang = "";
    switch (program.TargetLang) {
      case "fa":
        TTSLang = "fa-IR";
        break;
      case "ar":
        TTSLang = "ar-SA";
        break;
      case "tr":
        TTSLang = "tr-TR";
        break;
      case "ru":
        TTSLang = "ru-RU";
        break;
      case "fr":
        TTSLang = "fr-FR";
        break;
      case "zh":
        TTSLang = "zh-CN";
        break;
      case "ja":
        TTSLang = "ja-JP";
        break;
      case "es":
        TTSLang = "es-ES";
        break;
      case "de":
        TTSLang = "de-DE";
        break;
      case "en":
        TTSLang = "en-US";
        break;
      default:
        TTSLang = "en-US";
    }
    setState(() {
      flutterTts.setLanguage(TTSLang);
    });
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speak(String text) async {
    if (text.isEmpty) return;
    await flutterTts.stop();
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFeeeeee),
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: "dana")),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(selectedIndex: 2),
                  ),
                );
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0XFFffffff),
              ),
              child: SvgPicture.asset(
                "assets/images/terms/${widget.index}.svg",
                width: 80,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: jsonData != null
                  ? ListView.builder(
                      itemCount: jsonData.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            vertical: 3,
                            horizontal: 0,
                          ),
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 10,
                                children: [
                                  Text(
                                    jsonData[index][program.OrginLang]["means"],
                                    style: TextStyle(
                                      color: Color(0XFF0d4a7e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        jsonData[index][program
                                            .TargetLang]["means"],
                                        style: TextStyle(
                                          color: Color(0XFFfc9807),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setTTS();
                                          _speak(
                                            jsonData[index][program
                                                .TargetLang]["means"],
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          "assets/images/speak.svg",
                                          width: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.discreteCircle(
                            color: Color(0XFF10487b),
                            size: 80,
                          ),
                        ],
                      ),
                    ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color.fromARGB(255, 26, 26, 26)),
                ),
                child: Text(
                  "Sponsored Ads",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
