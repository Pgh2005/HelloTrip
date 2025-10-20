import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    // print("---------------  Essential  -------------");
    // print(jsonData);
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
              // physics: NeverScrollableScrollPhysics(),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 13,
                    horizontal: 0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('index : ${index}');
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
                            width: 60,
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



// ListView.builder(
//               itemCount: jsonData.length,
//               scrollDirection: Axis.vertical,
//               // physics: NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               itemBuilder: (context, index) {
//                 return Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(color: Colors.amber),
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Color(0XFFd9d9d9),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: index % 2 == 0
//                         ? Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 jsonData[index]['fa'],
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               SvgPicture.asset(
//                                 'assets/images/essentialWords/$index.svg',
//                                 width: 80,
//                               ),
//                             ],
//                           )
//                         : Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/images/essentialWords/$index.svg',
//                                 width: 80,
//                               ),
//                               Text(
//                                 jsonData[index]['fa'],
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ),
//                 );
//               },
//             )










// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//   child: Stack(
//     clipBehavior: Clip.none,
//     children: [
//       // دکمه اصلی
//       Container(
//         width: double.infinity,
//         height: 60,
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Align(
//           alignment: Alignment.centerRight,
//           child: Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: Text(
//               'مکان ها',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontFamily: 'Vazir', // فونت فارسی خودتون
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//         ),
//       ),
      
//       // آیکون که روی دکمه stack شده
//       Positioned(
//         left: 10,
//         top: -5, // برای اینکه کمی بیرون بزنه
//         child: Container(
//           width: 70,
//           height: 70,
//           decoration: BoxDecoration(
//             color: Color(0xFFE89F4A),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             Icons.map,
//             color: Colors.white,
//             size: 35,
//           ),
//         ),
//       ),
//     ],
//   ),
// )