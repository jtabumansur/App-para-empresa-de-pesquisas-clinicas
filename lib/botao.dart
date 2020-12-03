import 'dart:ui';
import 'package:flutter/material.dart';




class BotaoWidget extends StatelessWidget{

final String titulo;
final String rota;


BotaoWidget(this.titulo, this.rota): super();

@override
Widget build(BuildContext context){
  return new Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                      child: Text(titulo, 
                      textAlign: TextAlign.center,
                      style: TextStyle( color: Colors.black, fontSize: 18 ),),
                      color: Colors.deepPurpleAccent[100],
                      
                      onPressed: (){
                        if(rota=="pesquisa"){
                          Navigator.pushNamed(context,'/pesquisas');
                        }
                        else
                          if(rota=="suaspesquisas"){
                            Navigator.pushNamed(context,'/suaspesquisas');
                            }
                            else
                              if(rota=="sobrenos"){
                                Navigator.pushNamed(context, '/sobrenos');
                                }
                                else
                                  if(rota=="faleconosco"){
                                    Navigator.pushNamed(context, '/faleconosco');
                                    }

                      }
                    ),
                  );
                }

}
