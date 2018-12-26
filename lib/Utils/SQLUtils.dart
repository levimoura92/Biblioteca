import 'UserDSO.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseDatabase _db = FirebaseDatabase.instance;

class SQLUtils{
  UserDSO login(String username, String password){
    String pass = '123';
    String user = 'levi';

    if(username == user && password == pass){
      UserDSO usuario = new UserDSO(username, 1);
      return usuario;
    }else{
      return null;
    }
  }

  void gravaLivro(String titulo, String descr, int areaCod  ){
    String link = ""+titulo;
    _db.setPersistenceEnabled(true);
    DatabaseReference livros = _db.reference().child("livros");
    livros.push().set(<String, String>{
      "titulo": titulo
    });
  }
}