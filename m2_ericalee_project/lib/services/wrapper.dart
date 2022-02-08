import 'package:flutter/material.dart';
import 'package:m2_ericalee_project/screens/features_page.dart';
import 'package:m2_ericalee_project/screens/home_page.dart';
import '../screens/home_page.dart';
import 'authentication.dart';
import 'user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final user = Provider.of<User>(context);
    print(user);

    //return either home or authenticate widget
     if (user == null){
       return Authenticate();
     } else{
       return Home();
     }
  }
}