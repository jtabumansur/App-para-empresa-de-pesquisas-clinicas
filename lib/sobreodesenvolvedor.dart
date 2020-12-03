import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/background.dart';
import 'package:xyzpesquisaclinica/menu.dart';



class SobreoDesenvolvedorWidget extends StatefulWidget{
  @override
  _SobreoDesenvolvedorWidgetState createState()=> _SobreoDesenvolvedorWidgetState();
}

class _SobreoDesenvolvedorWidgetState extends State<SobreoDesenvolvedorWidget>{
    
String texto =  "\t\t\t\t\t\t\t\t\tEsse projeto faz parte da disciplina de desenvolvimento de softwares ministrado na FATEC de Ribeirao Preto e foi desenvolvido por Juliana Abumansur. O objetivo dele e desenvolver um software que facilite a divulgacao, recrutamento e a comunicacao entre os investigadores principais de pesquisa clinica e os voluntarios de pesquisa. ";
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("XYZ", style:TextStyle(color: Colors.deepPurpleAccent)),
      backgroundColor: Colors.black, 
      
    ),
    body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          Center( child:  SingleChildScrollView(
            
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.stretch ,
              children: <Widget>[
                    Image.asset("assets/imagens/Juliana.png", height: 150,alignment: Alignment.topCenter,),
                    Text(texto,textAlign: TextAlign.justify ,style: TextStyle(fontSize: 14),),
                      
                             
                ],
        ),
      ) 
    ),],)
  );     
}



botaoVoltar (BuildContext context){
  return Container(
    
    padding: const EdgeInsets.only(top:20),
    child: RaisedButton(
      child: Text("Efetuar login", 
        style: TextStyle( color: Colors.deepPurpleAccent, fontSize: 18,
      ),
    ),
    color: Colors.black,
    onPressed: (){
      //if(_formkey.currentState.validate(
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuWidget()),
            );
        //)
      }
    ),
  );
  
}





}

