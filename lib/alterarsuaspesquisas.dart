import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class AlterarsuasPesquisaWidget extends StatefulWidget{
  @override
  _AlterarsuasPesquisaWidgetState createState()=> _AlterarsuasPesquisaWidgetState();
}

class _AlterarsuasPesquisaWidgetState extends State<AlterarsuasPesquisaWidget>{
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  var txtNome = TextEditingController();
  var txtDescricao = TextEditingController();
  var txtData = TextEditingController();
  var db = FirebaseFirestore.instance;
  
  
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("Cadastro de pesquisa", style:TextStyle(color: Colors.deepPurpleAccent)),
      backgroundColor: Colors.black, 
      iconTheme: IconThemeData(
      color: Colors.deepPurpleAccent),          
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () { _reset();})
      ],
    ),
    body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
                image: new AssetImage(
                        'assets/imagens/moroccan-flower.png'))),
          ),
          Center( child: 
            SingleChildScrollView(
      
              padding: const EdgeInsets.all(20.0),
              child:  Form(
                key:_formkey,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.stretch ,
                  children: <Widget>[
                    campoTexto("Nome",txtNome, ),
                    campoTexto("Descricao",txtDescricao, ),
                    campoTexto("Descricao",txtDescricao, ),
                    botaoEnviar(context)          
                  ],
                ),
              ) 
            ),
          ),
        ],
      )
    );     
}

campoTexto(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 1),
    height: 40,
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontSize: 15),
      decoration: InputDecoration(
        labelText: rotulo,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Nome',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
      ),),
      controller: controle,
      validator: (value) {
        return(value.isEmpty) ? " Informe o valor" : null;
      },
    ),
  ); 
}

botaoEnviar (BuildContext context){
  return Container(
    padding: const EdgeInsets.only(top:20),
    width: 40,
    child: RaisedButton(
      child: Text("Enviar", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 20,
      ),
    ),
    color: Colors.black,
    onPressed: () async{
      if(txtNome!= ""){
      await db.collection("minhaspesquisas").doc("nome").update({
          "nome": txtNome,
      });}
      if(txtDescricao!=""){
      await db.collection("minhaspesquisas").doc("nome").update({
          "descricao": txtDescricao,
      });
      }
      if(txtData!=""){
      await db.collection("minhaspesquisas").doc("nome").update({
          "data": txtData,
      });
      }
    
      Navigator.pushNamed(context, '/pesquisas');
    },
  ));
}




void _reset(){
  setState((){
    txtNome.text="";
    txtDescricao.text="";
    
  });
}




}

