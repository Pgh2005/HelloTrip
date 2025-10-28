import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_trip/pages/learn_terms.dart';
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
        automaticallyImplyLeading: false,
      ),
      body: jsonData != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: List.generate(jsonData.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // go to LearnTerm
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LearnTerms(
                            title: jsonData[index]["fa"],
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                            width: 75,
                          ),
                          SizedBox(height: 10),
                          Text(
                            jsonData[index]["fa"],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              textBaseline: TextBaseline.alphabetic,
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
