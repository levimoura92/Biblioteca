import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CadastraLivro extends StatelessWidget{
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

class _FormCadastraLivroState extends State<FormCadastraLivro>{
  String _filePath="";
  final ttc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: 20.0)),
            new TextField(
              controller: ttc,
              decoration:
                new InputDecoration(
                  hintText: "Titulo",
                  filled: true,
                ),
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new RaisedButton(
              onPressed: _loadFile,
              child:
                new Column(
                  children: <Widget>[
                    new Icon(Icons.book, size: 90.0, semanticLabel: "livro"),
                    new Text("Selecione o Livro")
                  ],
                )
            ),
            new Padding(padding: EdgeInsets.only(top: 10.0)),

            new RaisedButton(
                onPressed: _saveBook,
                child:
                new Column(
                  children: <Widget>[
                    new Icon(Icons.save, size: 90.0, semanticLabel: "livro"),
                    new Text("Salvar")
                  ],
                )
            ),
            new Text(_filePath),
          ]
        ),
      ),
    );
  }

  void _loadFile() async{
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.ANY);
      if (filePath == '') {
        return;
      }
      //print("File path: " + filePath);
      setState((){this._filePath = filePath;});
    } on Exception catch (e) {
      debugPrint("Error while picking the file: " + e.toString());
    }
  }

  void _saveBook(){
    String titulo = ttc.text;
    //debugPrint("Path = $_filePath");
    //debugPrint("Titulo = $titulo");
    if(titulo != "" && _filePath != ""){
      debugPrint("$titulo is on path: $_filePath");
    }
  }

  @override
  void dispose() {
    ttc.dispose();
    super.dispose();
  }
}