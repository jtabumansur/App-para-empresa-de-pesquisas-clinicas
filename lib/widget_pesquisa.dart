class Pesquisa {
  
  String id;
  String nome;
  String descricao;

  Pesquisa(this.id, this.nome, this.descricao );

  //CONVERTER DOCUMENTO EM OBJETO
  Pesquisa.fromMap(Map<String,dynamic>map, String id){

  this.id= id ?? '';
  this.nome =map['nome'];
  this.descricao =map['descricao'];
  }
}