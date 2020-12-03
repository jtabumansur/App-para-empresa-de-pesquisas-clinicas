class Usuario {
  
  String _email;
  String _senha;

  Usuario(this._email,this._senha );

  //CONVERTER DOCUMENTO EM OBJETO
  Usuario.fromMap(Map<String,dynamic>map, String id){

  this._email =map['email'];
  this._senha =map['senha'];
  }

  



}
