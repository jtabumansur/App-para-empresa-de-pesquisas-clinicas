class SuaPesquisa {
  
  String id;
  String nome;
  String descricao;
  String data;

  SuaPesquisa(this.id, this.nome, this.descricao, data );

  //CONVERTER DOCUMENTO EM OBJETO
  SuaPesquisa.fromMap(Map<String,dynamic>map, String id){

  this.id= id ?? '';
  this.nome =map['nome'];
  this.descricao =map['descricao'];
  this.data =map['data'];
  }
}