import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_trip/components/program.dart';
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

  @override
  void initState() {
    super.initState();
    jsonData = program.DataTerms["groups"];
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
                mainAxisSpacing: 10,
                // childAspectRatio: 0.8,
                children: List.generate(jsonData.length, (index) {
                  return Flexible(
                    child: GestureDetector(
                      onTap: () {
                        // go to LearnTerm
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LearnTerms(
                              title: jsonData[index][program.OrginLang],
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
                              width: 68,
                            ),
                            SizedBox(height: 10),
                            Text(
                              jsonData[index][program.OrginLang],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                height: 1,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
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
                ],
              ),
            ),
    );
  }
}
