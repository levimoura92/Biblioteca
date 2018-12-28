import 'package:biblioteca_ceprj/DSO/LivroDSO.dart';
import 'package:biblioteca_ceprj/ui/Library.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:biblioteca_ceprj/Utils/FirebaseUtils.dart';

class CadastraLivro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro de Livros",
      theme: ThemeData.dark(),
      home: FormCadastraLivro(
        title: "Cadastro de Livros",
      ),
    );
  }
}

class FormCadastraLivro extends StatefulWidget {
  FormCadastraLivro({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FormCadastraLivroState createState() => _FormCadastraLivroState();
}

class _FormCadastraLivroState extends State<FormCadastraLivro> {
  String _filePath = "";
  final ttc = new TextEditingController();
  final tdc = new TextEditingController();
  String _message = "";
  List<StorageUploadTask> _tasks = <StorageUploadTask>[];
  final FirebaseStorage storage = new FirebaseStorage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(children: <Widget>[
          new Text("$_message"),
          new Padding(padding: EdgeInsets.only(top: 20.0)),
          new TextField(
            controller: ttc,
            decoration: new InputDecoration(
              hintText: "Titulo",
              filled: true,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          new TextField(
            controller: tdc,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: new InputDecoration(hintText: "Descrição"),
          ),
          new Padding(padding: EdgeInsets.only(top: 10.0)),
          new Row(children: <Widget>[
            new RaisedButton(
                onPressed: _loadFile,
                child: new Column(
                  children: <Widget>[
                    new Icon(Icons.book, size: 50.0, semanticLabel: "livro"),
                    new Text("Selecione o Livro")
                  ],
                )),
            new Padding(padding: EdgeInsets.symmetric(horizontal: 65.0)),
            new RaisedButton(
                onPressed: _saveBook,
                child: new Column(
                  children: <Widget>[
                    new Icon(
                      Icons.save,
                      size: 50.0,
                    ),
                    new Text("Salvar")
                  ],
                )),
          ]),
          new Text(_filePath),
        ]),
      ),
    );
  }

  void _loadFile() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.ANY);
      if (filePath == '') {
        return;
      }
      //print("File path: " + filePath);
      setState(() {
        this._filePath = filePath;
      });
    } on Exception catch (e) {
      debugPrint("Error while picking the file: " + e.toString());
    }
  }

  void _saveBook() async {
    String titulo = ttc.text;
    String dsc = tdc.text;


    if (titulo != "" && _filePath != "") {
      final Directory systemTempDir = Directory.systemTemp;
      final File file = File(_filePath);
      final StorageReference ref = storage.ref().child("livros").child("$titulo");
      final StorageUploadTask uploadTask = ref.putFile(
          file,
          StorageMetadata(customMetadata: <String, String>{
            'titulo': titulo,
            'descricao': dsc,
          }));
      LivroDSO livro = new LivroDSO(titulo, dsc, "livros/$titulo");
      FirebaseUtils().saveBook(livro);
      setState(() {
        _tasks.add(uploadTask);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Library()));
      });
    } else {
      setState(() {
        _message = "Voce nao pode deixar nem o titulo nem o arquivo em branco!";
      });
    }
  }

  @override
  void dispose() {
    ttc.dispose();
    super.dispose();
  }

  _downloadFile(StorageReference ref) {}
}
