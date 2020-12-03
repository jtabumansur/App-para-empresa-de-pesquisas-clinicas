import 'dart:ui';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget{

@override
Widget build(BuildContext context){
  return new 
    Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: new AssetImage(
             'assets/imagens/moroccan-flower.png'))),
          );
          
       
}
}