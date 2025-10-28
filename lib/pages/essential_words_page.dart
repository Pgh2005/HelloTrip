import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_trip/pages/learn_essential.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EssentialWordsPage extends StatefulWidget {
  const EssentialWordsPage({super.key});

  @override
  State<EssentialWordsPage> createState() => _EssentialWordsPageState();
}

class _EssentialWordsPageState extends State<EssentialWordsPage> {
  var jsonData;
  Future<void> loadEssential() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/essential.json',
    );
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data['words'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadEssential();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("کلمات ضروری", style: TextStyle(fontFamily: "dana")),
      ),
      body: jsonData != null
          ? ListView.builder(
              itemCount: jsonData.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 14,
                    horizontal: 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // go to LearnEssentialWords
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LearnEssentialWords(
                            title: jsonData[index]["fa"],
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      alignment: AlignmentGeometry.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          alignment: index % 2 == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          padding: EdgeInsets.symmetric(
                            horizontal: 90,
                            vertical: 8,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0XFFd9d9d9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            jsonData[index]['fa'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Positioned(
                          left: index % 2 == 1 ? 0 : null,
                          right: index % 2 == 0 ? 0 : null,
                          child: SvgPicture.asset(
                            'assets/images/essentialWords/$index.svg',
                            width: 70,
                          ),
                        ),
                      ],
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
    );
  }
}
