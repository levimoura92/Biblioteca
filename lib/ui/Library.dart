import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CadastraLivro.dart';
import 'package:biblioteca_ceprj/Utils/FirebaseUtils.dart';
import 'package:biblioteca_ceprj/DSO/LivroDSO.dart';
import 'CadastraUsuario.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

final FirebaseDatabase _db = FirebaseDatabase.instance;

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LibraryPage(),
    );
  }
}

class LibraryPage extends StatefulWidget {
  LibraryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;
  String _permissao = "";
  List<LivroDSO> livros = new List();
  LivroDSO livro;
  @override
  void initState() {
    super.initState();
    databaseReference =
        database.reference().child("livros");
    livro = new LivroDSO("", "", "");
    databaseReference.onChildAdded.listen(_onEntryAdded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Escolha um livro!"),
      ),
      body: new Center(
        child: new Column(children: <Widget>[
          new Text("$_permissao"),
          new RaisedButton(onPressed: _cadastraLivro,
              child: Column(
                children: <Widget>[
                  Icon(Icons.book),
                  Text("Escolha o livro"),
                ],
              )
          ),
          Flexible(
              flex: 0,
              child: FirebaseAnimatedList(
                  query: databaseReference,
                  itemBuilder: (_, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.title),
                        title: Text(
                          livros[index].getTitulo(),
                        ),
                        subtitle: Text(livros[index].getDesc()),
                      ),
                    );
                  }
                  )
          )
        ]),
      ),
    );
  }

  Future<Null> _downloadFile(StorageReference ref) async {
    final String url = await ref.getDownloadURL();
    final http.Response downloadData = await http.get(url);
    final Directory systemTempDir = Directory.systemTemp;
    final File tempFile = File('${systemTempDir.path}');
    if (tempFile.existsSync()) {
      await tempFile.delete();
    }
    await tempFile.create();
    final StorageFileDownloadTask task = ref.writeToFile(tempFile);
  }

  void _cadastraLivro() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastraLivro()));
  }

  void _cadastraUsuario() async {
    FirebaseUser currentUser = await _auth.currentUser();
    if (currentUser.email == "levidasilvamoura@gmail.com") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CadastraUsuario()));
    } else {
      setState(() {
        _permissao = "Voce nao tem permissao para adcionar novos usuarios";
      });
    }
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new Card(
      child: ListTile(
        leading: new Icon(Icons.book),
        title: Text(livros[index].getTitulo()),
        subtitle: Text(livros[index].getDesc()),
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      livros.add(LivroDSO.fromSnapshot(event.snapshot));
    });
  }
}
