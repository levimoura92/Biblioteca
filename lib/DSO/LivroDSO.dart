import 'package:firebase_database/firebase_database.dart';

class LivroDSO{
  String _titulo;
  String _desc;
  String _link;
  String key;

  LivroDSO(this._titulo, this._desc, this._link);

  String getTitulo() => _titulo;

  void setTitulo(String titulo){
    this._titulo = titulo;
  }

  String getLink() => _link;

  void setLink(String link){
    this._link = link;
  }

  String getDesc() => _desc;

  void setCod(String desc){
    this._desc = desc;
  }

  toJson(){
    return {
      "titulo":_titulo,
      "link" : _link,
      "descricao": _desc,
    };
  }

  LivroDSO.fromSnapshot(DataSnapshot snapshot){
    key = snapshot.key;
    _titulo = snapshot.value["titulo"];
    _desc = snapshot.value["descricao"];
    _link = snapshot.value["link"];
  }


}