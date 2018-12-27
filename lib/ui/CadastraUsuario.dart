import 'package:flutter/material.dart';
import 'package:biblioteca_ceprj/DSO/UserDSO.dart';
import 'package:biblioteca_ceprj/Utils/FirebaseUtils.dart';

class CadastraUsuario extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro de Usuarios",
      theme: ThemeData.dark(),
      home: FormCadastraUsuario(
        title: "Cadastro de Usuarios",
      ),
    );
  }
}

class FormCadastraUsuario extends StatefulWidget {
  FormCadastraUsuario({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FormCadastraUsuarioState createState() => FormCadastraUsuarioState();
}

class FormCadastraUsuarioState extends State<FormCadastraUsuario>{
  final tec = new TextEditingController();
  final tpc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Email",
                  icon: new Icon(Icons.email),
                ),
                controller: tec,
              ),
              new TextField(
                obscureText: true,
                controller: tpc,
                decoration: new InputDecoration(
                  hintText: "Password",
                  icon: new Icon(Icons.security),
                ),
              ),
              new RaisedButton(onPressed: _clear, child: new Text("Clear"),),
              new RaisedButton(onPressed: _cadastrar, child: new Text("Cadastrar"),),
            ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    tec.dispose();
    tpc.dispose();
    super.dispose();
  }

  void _clear() {
    tec.clear();
    tpc.clear();
  }

  void _cadastrar() {

  }
}