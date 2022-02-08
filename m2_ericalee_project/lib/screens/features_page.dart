import 'package:flutter/material.dart';

import 'FirstScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';
import 'home_page.dart';

class Features extends StatelessWidget {
  //initialize the data

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        icon: Icon(
                      Icons.map,
                      color: Colors.black,
                    )),
                    Tab(
                        icon: Icon(
                      Icons.bus_alert,
                      color: Colors.black,
                    )),
                    Tab(
                        icon: Icon(Icons.thermostat_outlined,
                            color: Colors.black)),
                  ],
                ),
                backgroundColor: Colors.indigo[100],
              )),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
