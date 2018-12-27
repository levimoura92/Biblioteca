import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('logged in'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black38,
      body: new Center(
        child: new Text('login'),
      ),
    );
  }

}