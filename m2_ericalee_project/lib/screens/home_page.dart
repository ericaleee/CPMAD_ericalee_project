import 'package:flutter/material.dart';
import 'package:m2_ericalee_project/screens/features_page.dart';
import 'package:m2_ericalee_project/services/authentication.dart';

import 'about_page.dart';
import 'profile_page.dart';
import 'features_page.dart';
import '../drawer.dart';

class Home extends StatefulWidget {
  // This widget is the root of your application.

  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { 
  String title = 'Available Features';
  int index = 0;
  List<Widget> list = [Features(),Profile(),About()];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title,
          style: TextStyle(
            fontFamily: 'MommyLemon',
            color: Colors.black,
            fontSize: 30,
          )),
          backgroundColor: Colors.indigo[200],
        ),
        // body: Home(),
        // drawer: MyDrawer(),
        body: list[index],
        drawer: MyDrawer (onTap: (context, i, txt){
          setState(() {index = i;
          title = txt;
          Navigator.pop(context);});
        })
      
    );
  }
  }