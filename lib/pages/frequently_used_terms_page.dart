import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FrequentlyUsedTermsPage extends StatefulWidget {
  const FrequentlyUsedTermsPage({super.key});

  @override
  State<FrequentlyUsedTermsPage> createState() =>
      _FrequentlyUsedTermsPageState();
}

class _FrequentlyUsedTermsPageState extends State<FrequentlyUsedTermsPage> {
  var jsonData;
  Future<void> loadTerms() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/terms.json',
    );
    var data = jsonDecode(jsonString);
    setState(() {
      jsonData = data["groups"];
    });
    // print("-------------- Groups ---------------");
    // print(jsonData);
  }

  @override
  void initState() {
    super.initState();
    loadTerms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اصطلاحات پرکاربرد", style: TextStyle(fontFamily: "dana")),
      ),
      body: jsonData != null
          ? Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: List.generate(jsonData.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // go to LearnTerm
                      print(
                        "Subject : ${jsonData[index]["fa"]} , index : $index",
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0XFFd9d9d9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/terms/$index.svg",
                            width: 90,
                          ),
                          SizedBox(height: 10),
                          Text(
                            jsonData[index]["fa"],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.discreteCircle(
                    color: Color(0XFF10487b),
                    size: 80,
                  ),
                  // SizedBox(height: 50),
                  // Text(
                  //   "Loading ...",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     color: Color(0XFF10487b),
                  //     fontSize: 15,
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
}
