import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/background.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xyzpesquisaclinica/usuarios.dart';


class LoginWidget extends StatefulWidget{
  @override
  _LoginWidgetState createState()=> _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>{
  var db=FirebaseFirestore.instance;
  List<Usuario> usuarios = List(); //ouvir todos os eventos que podem ocorrer na colecao
  StreamSubscription<QuerySnapshot>listen;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
 
  @override
  void initState(){
    super.initState();
    //Quando ocorrer um evento na colecao, recuperar todos os documentos
    listen?.cancel();
    listen =db.collection("usuarios").snapshots().listen((res) {
      //Converter todos os documentos em objetos
      setState((){
        usuarios = res.docs.map(
          (e) => Usuario.fromMap(e.data(),e.id)).toList();
        
      });

     });

  }
  
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("XYZ", style:TextStyle(color: Colors.deepPurpleAccent)),
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
          BackgroundWidget(),
          Center( child:  SingleChildScrollView(
            
      padding: const EdgeInsets.all(20.0),
      child:  Form(
        key:_formkey,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: <Widget>[
            Image.asset("assets/imagens/mandala.png", height: 150,alignment: Alignment.topCenter,),
            campoLogin("Email",txtEmail, ),
            campoSenha("Senha",txtSenha),
            botaoLogin(context),
            
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  botaoCadastrese(context),
                  botaoEsqueceuSenha(context),
                ],
              )
              
            )
            
            
          ],
        ),
      ) 
    ),),],)
  );     
}

campoLogin(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2),
    height: 35,
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.black, fontSize: 12),
      decoration: InputDecoration(
        labelText: rotulo,
        filled: true,
        fillColor: Colors.deepPurpleAccent[100],
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),),
      controller: controle,
      validator: (value) {
        return(value.isEmpty) ? " Informe o valor" : null;
      },
    ),
  ); 
}
campoSenha(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2),
    height: 35,
    child: TextFormField(
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.black, fontSize: 12),
      decoration: InputDecoration(
        labelText: rotulo,
        filled: true,
        fillColor: Colors.deepPurpleAccent[100],
        hintText: 'Senha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
      ),),
      controller: controle,
      validator: (value) {
        return(value.isEmpty) ? " Informe o valor" : null;
      },
    ),
  ); 
}

botaoLogin (BuildContext context){
  return Container(
    
    padding: const EdgeInsets.only(top:20),
    child: RaisedButton(
      child: Text("Efetuar login", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 18,
      ),
    ),
    color: Colors.black,
      onPressed: () async{
        //validacao
        var db = FirebaseFirestore.instance;

        QuerySnapshot usr = await db.collection("usuarios")
          .where('email', isEqualTo: txtEmail.text)
          .where('senha', isEqualTo: txtSenha.text).get();

        if ( usr.docs.isEmpty ){
          txtEmail.text="";
          txtSenha.text="";
          print("USUÁRIO NÃO ENCONTRADO!");
        }else{
        Navigator.pushNamed(context, '/menu');
        }
    
      },         
    ),
  );
  
}
botaoCadastrese (BuildContext context){  
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(top:5),
    child: FlatButton(
      child: Text("Cadastre-se", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 10,
      ),
    ),
    color: Colors.transparent,
    onPressed: (){
     Navigator.pushNamed(context, '/cadastro');
    },
  ));
}
botaoEsqueceuSenha (BuildContext context){
  return Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(top:5),
    child: FlatButton(
      child: Text("Esqueceu a sua senha?", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 10,
      ),
    ),
    color: Colors.transparent,
    onPressed: (){/*
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecuperaSenhaWidget()));
      */
    },
  ));
}

void _reset(){
  setState((){
    txtEmail.text="";
    txtSenha.text="";
    
  });
}

}