import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/background.dart';
import 'package:xyzpesquisaclinica/menu.dart';



class SobreNosWidget extends StatefulWidget{
  @override
  _SobreNosWidgetState createState()=> _SobreNosWidgetState();
}

class _SobreNosWidgetState extends State<SobreNosWidget>{
    
String texto =  "\t\t\t\t\t\t\t\t\tSomos um empresa de pesquisa Clinica focada em qualidade e resultados. Nossa empresa esta ha muitos anos no mercado e e um referencial em excelencia e seguranca.";
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
                    Image.asset("assets/imagens/mandala.png", height: 150,alignment: Alignment.topCenter,),
                    Text(texto,textAlign: TextAlign.justify ,style: TextStyle(fontSize: 20),),
                      
                             
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

