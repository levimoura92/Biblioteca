import 'package:biblioteca_ceprj/UserDSO.dart';

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
}