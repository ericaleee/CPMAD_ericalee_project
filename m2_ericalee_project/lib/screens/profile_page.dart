import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth.dart';
import 'settings_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/database.dart';
import 'package:provider/provider.dart';
import '../services/user_list.dart';
import '../services/user.dart';





class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }

   return StreamProvider<List<User>>.value(
     value: DatabaseService().users,
     child: Scaffold(
       backgroundColor: Colors.indigo[50],
          appBar: AppBar(
            backgroundColor: Colors.indigo[100],
          actions: <Widget>[
             FlatButton.icon(
               icon: Icon(Icons.person),
               label: Text('settings'),
               onPressed: () => _showSettingsPanel(),
             )]
            ),
      body: UserList(),
     
   ));
  }
}
