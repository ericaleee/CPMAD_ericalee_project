import 'package:flutter/material.dart';
import '../services/constants.dart';
import '../services/database.dart';
import '../services/user.dart';
import 'package:provider/provider.dart';
import '../services/loading.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  
  String _currentName;
  String _currentEmail;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
    stream: DatabaseService(uid: user.uid).userData,
    builder: (context, snapshot){
      if(snapshot.hasData){

      // ignore: omit_local_variable_types
      UserData userData = snapshot.data;

      return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your profile',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: userData.name,
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            initialValue: userData.email,
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter an email' : null,
            onChanged: (val) => setState(() => _currentEmail = val),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child:Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              if(_formKey.currentState.validate()){
                await DatabaseService(uid: user.uid).updateUserData(
                  _currentName ?? userData.name,
                  _currentEmail ?? userData.email
                );
                Navigator.pop(context);
              }
            },
          )
        ],
      ));
      } else{
          return Loading();
      }
    
    });
  }
}