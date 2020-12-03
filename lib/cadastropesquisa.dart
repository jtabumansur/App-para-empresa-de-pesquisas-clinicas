import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class CadastroPesquisaWidget extends StatefulWidget{
  @override
  _CadastroPesquisaWidgetState createState()=> _CadastroPesquisaWidgetState();
}

class _CadastroPesquisaWidgetState extends State<CadastroPesquisaWidget>{
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  var txtNome = TextEditingController();
  var txtDescricao = TextEditingController();
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
      
      await db.collection("cadastropesquisa").add(
        {
        
        "nome":txtNome.text,
        "descricao":txtDescricao.text,
        }
      );
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

