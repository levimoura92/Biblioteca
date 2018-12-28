import 'package:flutter/material.dart';
import 'ui/Library.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:biblioteca_ceprj/Utils/FirebaseUtils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca CEPRJ',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Biblioteca CEPRJ: Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _senhaInvalida = "";
  final TextEditingController _tuc = new TextEditingController();
  final TextEditingController _tpc = new TextEditingController();

  void _clear(){
    setState(() {
      _tuc.clear();
      _tpc.clear() ;
      _senhaInvalida="";
    });
  }

  void _login() async{
    FirebaseUser user = await FirebaseUtils().login(_tuc.text, _tpc.text);
    setState(() {
      if(user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Library()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: 0.0,
              color: Colors.red,
              child:
                new Text(_senhaInvalida),
            ),
            new TextField(
              autofocus: true,
              controller: _tuc,
              decoration: new InputDecoration(
                hintText: "Usuario: ",
                filled: true,
               // fillColor: Colors.indigoAccent,
              ),
            ),
            new TextField(
              autofocus: true,
              obscureText: true,
              controller: _tpc,
              decoration: new InputDecoration(
                hintText: "Password: ",
                filled: true,
                //fillColor: Colors.indigoAccent,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0)),
                new Container(
                  margin: EdgeInsets.all(20.0),
                  child: new RaisedButton(onPressed: _clear,
                    color: Colors.red,
                    child: new Text("Clear!"),),
                ),
                new Container(
                  margin: EdgeInsets.all(20.0),
                  child: new RaisedButton(onPressed: _login,
                    color: Colors.lightBlueAccent,
                    child: new Text("Login"))
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
