import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../services/constants.dart';
import '../services/loading.dart';


class SignIn extends StatefulWidget {
   final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        elevation: 0.0,
        title: Text('   Log In',
        style: TextStyle(fontSize: 35.0, fontFamily: 'MommyLemon', color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed:() {
              widget.toggleView();
            }
          )
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget> [
                SizedBox(height: 20.0),
                TextFormField(
                   decoration: textInputDecoration.copyWith(hintText: 'Email'),
                   validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() => email = val);
                  }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                   decoration: textInputDecoration.copyWith(hintText: 'Password'),
                   validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);
                  }
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[100],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                   if (_formKey.currentState.validate()){
                     setState(() => loading = true);
                     dynamic result = await _auth.signInWithEmailandPassword(email, password);
                     if(result == null){
                       setState(() => error = 'could not sign in with those credentials!');
                       loading = false;
                     }
                   }
                  },
                ),
                 SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                Expanded(
            child: Image.asset('images/login.jpg', fit: BoxFit.contain,),
          )
              ],
            )
          )

        )
    );
  }
}