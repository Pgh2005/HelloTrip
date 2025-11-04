import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDialog extends StatelessWidget {
  const AccountDialog({super.key});

  Future<void> setAccountName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (name.isNotEmpty) {
      await prefs.setString('account_name', name);
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final AccountNameController = TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        width: 350,
        height: 400,
        child: Column(
          children: [
            Spacer(),
            Text(
              "حساب کاربری",
              style: TextStyle(
                color: Color(0XFF10487b),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Icon(Icons.account_circle_rounded, color: Colors.black54, size: 70),
            Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: AccountNameController,
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black45,
                decoration: InputDecoration(
                  labelText: "نام کاربری",
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                await setAccountName(AccountNameController.text);
                Navigator.of(context).pop();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0XFF10487b),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text("تائید", style: TextStyle(color: Colors.white)),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
