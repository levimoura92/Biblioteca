import 'package:flutter/material.dart';
import 'Utils/SQLUtils.dart';
import 'ui/Library.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca CEPRJ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Biblioteca CEPRJ: Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  void _login(){
    setState(() {
      String usuario = "levi";
      String senha = "123";
      if(_tpc.text == senha && _tuc.text == usuario) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Library()));
      }else{
        _senhaInvalida = "Usuario ou Sennha invalidos";
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
      body:
        Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
