import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CadastraLivro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro de Livros",
      theme: ThemeData.dark(),
      home: FormCadastraLivro(title: "Cadastro de Livros",),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new TextFormField(
              initialValue: "Titulo",
            ),
            new RaisedButton(onPressed: _loadFile, child: new Text("Select the book"),),
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
      print("File path: " + filePath);
      setState((){this._filePath = filePath;});
    } on Exception catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

}