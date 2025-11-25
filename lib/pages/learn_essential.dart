import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hello_trip/components/program.dart';
import 'package:hello_trip/pages/home_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LearnEssentialWords extends StatefulWidget {
  final String title;
  final int index;
  const LearnEssentialWords({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<LearnEssentialWords> createState() => _LearnEssentialWordsState();
}

class _LearnEssentialWordsState extends State<LearnEssentialWords> {
  var jsonData;
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    jsonData = program.DataEssential["wordsdata"][widget.index];
    _initTts();
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
                    builder: (context) => HomePage(selectedIndex: 0),
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
                "assets/images/essentialWords/${widget.index}.svg",
                width: 80,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: jsonData != null
                  ? GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.9,
                      children: List.generate(jsonData.length, (index) {
                        return Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            vertical: 3,
                            horizontal: 0,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
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
                                      jsonData[index]["en"]["means"],
                                      style: TextStyle(
                                        color: Color(0XFFfc9807),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _speak(jsonData[index]["en"]["means"]);
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
                        );
                      }),
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
