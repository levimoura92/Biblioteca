import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:biblioteca_ceprj/DSO/LivroDSO.dart';

class FirebaseUtils{
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  DatabaseReference _databaseReference;

  Future<FirebaseUser> login(String email, String password) async{
    FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<FirebaseUser> createUser(String email, String password) async{
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future saveBook(LivroDSO livro){
    _databaseReference = _database.reference().child("Livros");
    _databaseReference.push().set(livro.toJson());
  }

  List<LivroDSO> getListLivros(Event event){
    List<LivroDSO> livros = List();
    livros.add(LivroDSO.fromSnapshot(event.snapshot));
    return livros;
  }
}