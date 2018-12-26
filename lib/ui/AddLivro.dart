import 'package:biblioteca_ceprj/Utils/SQLUtils.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_document_picker/flutter_document_picker.dart';
class AddLivro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Upload de Livros",
      home: _AddLivro().build(context),
    );
  }
  
}

class _AddLivro extends State{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String titulo = "";
  dynamic docPath;


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: new Text("Adicionar um Livro"),
       ),
       body: Column(
         children: <Widget>[
           Flexible(
             flex: 0,
             child: Form(
               key: formKey,
               child: Flex(
                 children: <Widget>[
                   ListTile(
                     leading: Icon(Icons.title),
                     title: TextFormField(
                       initialValue: "titulo",
                       onSaved: (val) => titulo = val,
                     )
                   ),
                   ListTile(
                     leading: Icon(Icons.book),
                     title: TextFormField(
                     )
                   ),
               ),
             ),
           )
         ],
       ),
     );
  }
  
}