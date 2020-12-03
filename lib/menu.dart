import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/botao.dart';



class MenuWidget extends StatefulWidget{
  @override
  _MenuWidgetState createState()=> _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget>{
  

  
@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text("Menu", style:TextStyle(color: Colors.deepPurpleAccent)),
      backgroundColor: Colors.black, 
      iconTheme: IconThemeData(
      color: Colors.deepPurpleAccent),          
      ),
    body: Stack(
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                    image: new AssetImage(
                    'assets/imagens/moroccan-flower.png'))),
                  ),
          ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
          Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children : [
              BotaoWidget("Pesquisas","pesquisa" ),
              BotaoWidget("Suas pesquisas","suaspesquisas" ),
            ]        
          ),
        ),    
        Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children : [
              BotaoWidget("Sobre nos","sobrenos" ),
              BotaoWidget("Fale conosco","faleconosco" ),
            ]        
          ),
        ),   
        SnackBarPage(),
    
  ],
)
            ],));     
}

}
class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text(''),
            action: SnackBarAction(
              label: 'seguir',
              onPressed: () {
                Navigator.pushNamed(context, '/sobreodesenvolvedor');
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Saiba mais sobre o app'),
      ),
    );
  }
}