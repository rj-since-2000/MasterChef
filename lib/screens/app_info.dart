import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('App Info'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'MasterChef',
                style: TextStyle(fontSize: 50),
              ),
              Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2),
              Icon(Icons.fastfood,size: 200,color: Colors.red,),
            ],
          ),
        ),
      ),
    );
  }
}
