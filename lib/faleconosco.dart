import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/background.dart';
import 'package:xyzpesquisaclinica/menu.dart';


class FaleConoscoWidget extends StatefulWidget{
  @override
  _FaleConoscoWidgetState createState()=> _FaleConoscoWidgetState();
}

class _FaleConoscoWidgetState extends State<FaleConoscoWidget>{
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtTelefone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMsg = TextEditingController();
  
  
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("Cadastro", style:TextStyle(color: Colors.deepPurpleAccent)),
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
          Center( child: 
            SingleChildScrollView(
      
              padding: const EdgeInsets.all(20.0),
              child:  Form(
                key:_formkey,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.stretch ,
                  children: <Widget>[
                    campoTexto("Nome",txtNome, ),
                    campoTexto("Telefone",txtTelefone, ),
                    campoTexto("Email",txtEmail, ),
                    campoMensagem("Mensagem",txtMsg, ),
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
    height: 20,
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontSize: 15),
      decoration: InputDecoration(
        labelText: rotulo,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Login',
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
campoMensagem(rotulo, controle){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 1),
    height: 100,
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.black, fontSize: 15) ,
      decoration: InputDecoration(
        labelText: rotulo,
        filled: true,
        fillColor: Colors.white,
        hintText: 'Login',
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
    padding: const EdgeInsets.only(top:5),
    width: 40,
    child: RaisedButton(
      child: Text("Enviar", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 20,
      ),
    ),
    color: Colors.black,
    onPressed: (){
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuWidget()),
            );
    },
  ));
}




void _reset(){
  setState((){
    txtNome.text="";
    txtTelefone.text="";
    txtEmail.text="";
    txtMsg.text="";
    
  });
}




}

