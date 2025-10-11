import 'package:flutter/material.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.account_box_rounded, color: Colors.black87, size: 60),
          Spacer(),
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
