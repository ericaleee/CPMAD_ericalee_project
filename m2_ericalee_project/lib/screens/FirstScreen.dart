import 'package:flutter/material.dart';
import 'home_page.dart';
import 'googlemap.dart';

class FirstScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
             Padding(
                padding: const EdgeInsets.all(20.0),       
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/googlemap.png',),
                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text('Click to view'),
                      color: Colors.indigo[100],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MapView())); 
                        
                      },
                    ),
                  ],
                ),
              ),
          ],
      ),
    );
  }
}