import 'package:flutter/material.dart';
import 'package:hello_trip/components/program.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrginLangDialog extends StatefulWidget {
  const OrginLangDialog({super.key});

  @override
  State<OrginLangDialog> createState() => _OrginLangDialogState();
}

class _OrginLangDialogState extends State<OrginLangDialog> {
  String? _selectedLanguage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedLanguage = _codeToLanguageName(program.OrginLang);
    });
  }

  final List<String> _languages = [
    'English',
    'Spanish',
    'Deutsch',
    'French',
    'Japanese',
    'Russian',
    'Portuguese (Chineese)',
    'Turkish',
    'فارسی',
    'العربیه',
  ];

  String _codeToLanguageName(String code) {
    switch (code) {
      case "fa":
        return "فارسی";
      case "ar":
        return "العربیه";
      case "tr":
        return "Turkish";
      case "ru":
        return "Russian";
      case "fr":
        return "French";
      case "zh":
        return "Portuguese (Chineese)";
      case "ja":
        return "Japanese";
      case "es":
        return "Spanish";
      case "de":
        return "Deutsch";
      case "en":
        return "English";
      default:
        return "English";
    }
  }

  Future<void> setOrginLang(String lang) async {
    if (lang.isNotEmpty) {
      String language = "";
      switch (lang) {
        case "فارسی":
          language = "fa";
          break;
        case "العربیه":
          language = "ar";
          break;
        case "Turkish":
          language = "tr";
          break;
        case "Russian":
          language = "ru";
          break;
        case "French":
          language = "fr";
          break;
        case "Portuguese (Chineese)":
          language = "zh";
          break;
        case "Japanese":
          language = "ja";
          break;
        case "Spanish":
          language = "es";
          break;
        case "Deutsch":
          language = "de";
          break;
        case "English":
          language = "en";
          break;
        default:
          language = "fa";
      }
      setState(() {
        program.OrginLang = language;
        _selectedLanguage = lang;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('orgin_lang', language);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 350,
        // height: 400,
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Color(0XFF10487b),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "زبان",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            // Language List
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  String language = _languages[index];
                  return RadioListTile<String>(
                    title: Text(language),
                    value: language,
                    groupValue: _selectedLanguage,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedLanguage = value;
                      });
                    },
                  );
                },
              ),
            ),
            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 125,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0XFF10487b),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "انصراف",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                GestureDetector(
                  onTap: () {
                    setOrginLang(_selectedLanguage!);
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 125,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0XFF10487b),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("تایید", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
