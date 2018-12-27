class UserDSO{
  String _user;
  int _areaCod;

  UserDSO(this._user, this._areaCod);

  String getUser() => this._user;

  void setUser(String user){
    this._user = user;
  }

  int getAreaCod() => this._areaCod;

  void setAreaCod(int areaCod){
    this._areaCod = areaCod;
  }
}