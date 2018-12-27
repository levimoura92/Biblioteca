import 'package:flutter/material.dart';
import 'ui/CadastraLivro.dart';
import 'ui/Home.dart';

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
  final tuc = new TextEditingController();
  final tpc = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: tuc,
              autofocus: true,
              decoration: new InputDecoration(
                hintText: "Usuario: ",
                filled: true,
               // fillColor: Colors.indigoAccent,
              ),
            ),
            new TextField(
              controller: tpc,
              autofocus: true,
              obscureText: true,
              decoration: new InputDecoration(
                hintText: "Password: ",
                filled: true,
                //fillColor: Colors.indigoAccent,
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new FlatButton(
              color: Colors.redAccent,
              padding: EdgeInsets.only(left:100.0, right: 100.0, top: 20.0, bottom: 20.0),
              onPressed: _clearFields,
              child:
                new Text("Clear")
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new RaisedButton(
              padding: EdgeInsets.only(left:100.0, right: 100.0, top: 20.0, bottom: 20.0),
              onPressed: _login,
              child:
                new Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void _login(){
    String user = tuc.text;
    String password = tpc.text;
    if(user == "levi" && password == "123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CadastraLivro()),
      );
    }
  }

  void _clearFields(){
    tuc.clear();
    tpc.clear();
  }

  @override
  void dispose() {
    tuc.dispose();
    tpc.dispose();
    super.dispose();
  }
}
