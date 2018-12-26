import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CadastraLivro.dart';

final FirebaseDatabase _db = FirebaseDatabase.instance;

class Library extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LibraryPage(),
    );
  }

}

class LibraryPage extends StatefulWidget{
  LibraryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Escolha um livro!"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[

            new FloatingActionButton(onPressed: _cadastraLivro, child: Icon(Icons.add_circle),)
          ],
        ),
      ),

    );

  }

  void _cadastraLivro(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CadastraLivro()));
  }
}