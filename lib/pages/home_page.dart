import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:hello_trip/pages/essential_words_page.dart';
import 'package:hello_trip/pages/frequently_used_terms_page.dart';
import 'package:hello_trip/pages/online_translation_page.dart';
import 'package:hello_trip/pages/tourist_places_page.dart';
import 'package:hello_trip/pages/user_account_page.dart';

class HomePage extends StatefulWidget {
  final int selectedIndex;
  const HomePage({super.key, required this.selectedIndex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  final List<Widget> pages = [
    EssentialWordsPage(),
    TouristPlacesPage(),
    FrequentlyUsedTermsPage(),
    UserAccountPage(),
    OnlineTranslationPage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFFf6706f),
          // foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = 4;
            });
          },
          child: const Icon(Icons.translate_rounded, color: Color(0XFF2a0f4b)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            Icons.text_fields_rounded,
            Icons.location_on,
            Icons.menu_book_rounded,
            Icons.account_circle_outlined,
          ],
          activeIndex: _selectedIndex,
          backgroundColor: Color(0XFF10487b),
          activeColor: Color(0xFFf88f21),
          splashColor: Colors.white,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
