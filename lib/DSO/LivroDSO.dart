class LivroDSO{
  String _titulo;
  int _cod;
  String _link;
  int _areaCod;

  LivroDSO(this._titulo, this._cod, this._link, this._areaCod);

  String getTitulo() => _titulo;

  void setTitulo(String titulo){
    this._titulo = titulo;
  }

  String getLink() => _link;

  void setLink(String link){
    this._link = link;
  }

  int getCod() => _cod;

  void setCod(int cod){
    this._cod = cod;
  }

}