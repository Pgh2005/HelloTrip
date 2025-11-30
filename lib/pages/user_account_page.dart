import 'package:flutter/material.dart';
import 'package:hello_trip/components/account_dialog.dart';
import 'package:hello_trip/components/orgin_lang_dialog.dart';
import 'package:hello_trip/components/program.dart';
import 'package:hello_trip/pages/target_lang_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateName();
  }

  void updateName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = program.name;
      prefs.setString("account_name", name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "حساب کاربری",
          style: TextStyle(
            fontFamily: "dana",
            color: Color(0XFF10487b),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Icon(Icons.account_box_rounded, color: Colors.black87, size: 60),
          SizedBox(height: 10),
          Text(
            name.isNotEmpty ? name : "",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) => AccountDialog(),
              );
              updateName();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0XFF10487b),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  Spacer(),
                  Text(
                    "حساب کاربری",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.account_box_rounded,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) => OrginLangDialog(),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0XFF10487b),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  Spacer(),
                  Text(
                    "زبان",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.language_rounded,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TargetLangPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0XFF10487b),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  Spacer(),
                  Text(
                    "زبان مقصد راانتخاب کن ",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.description_rounded,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0XFF10487b),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  Spacer(),
                  Text(
                    "رتبه بندی",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.rate_review_rounded,
                    color: Colors.grey[400],
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
