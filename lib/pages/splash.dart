import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello_trip/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

// flutter_tts
// speech_to_text
// google_cloude_translation

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
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
