import 'package:flutter/material.dart';

class TouristPlacesPage extends StatefulWidget {
  const TouristPlacesPage({super.key});

  @override
  State<TouristPlacesPage> createState() => _TouristPlacesPageState();
}

class _TouristPlacesPageState extends State<TouristPlacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مکان های توریستی", style: TextStyle(fontFamily: "dana")),
      ),
      body: Center(child: Text("Tourist Locations Terms Page")),
    );
  }
}
