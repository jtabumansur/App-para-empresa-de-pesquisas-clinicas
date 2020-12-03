import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xyzpesquisaclinica/suapesquisaWidget.dart';
import 'dart:async';


class SuasPesquisasWidget extends StatefulWidget{
  @override
  _SuasPesquisasWidgetState createState()=> _SuasPesquisasWidgetState();
}

class _SuasPesquisasWidgetState extends State<SuasPesquisasWidget>{
var db=FirebaseFirestore.instance;
  List<SuaPesquisa> minhaspesquisas = List(); //ouvir todos os eventos que podem ocorrer na colecao
  StreamSubscription<QuerySnapshot>listen;
  @override
  void initState(){
    super.initState();
    listen?.cancel();
    listen =db.collection("minhaspesquisas").snapshots().listen((res) {
      
      setState((){

        minhaspesquisas = res.docs.map(
          (e) => SuaPesquisa.fromMap(e.data(),e.id)).toList();
        
      });

     });

  }
@override
Widget build(BuildContext context){
  return Scaffold(
      appBar: AppBar(
        title: new Text("Lista de pesquisas",
            style: TextStyle(color: Colors.deepPurpleAccent)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
      ),
    body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("minhaspesquisas").snapshots(),
        builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Center(child: Text('Erro de conexao'));
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default: 
                return ListView.builder(
                  itemCount: minhaspesquisas.length,
                  
                  itemBuilder: (context, index){
                    return ListTile(
                      isThreeLine: true,
                      title: Text(minhaspesquisas[index].nome, style: TextStyle(fontSize:18)),
                      subtitle: Column(

                        children: <Widget>[
                          Text(minhaspesquisas[index].descricao, style: TextStyle(fontSize:12)),
                          new Align(alignment: Alignment.centerLeft, child: new Text(minhaspesquisas[index].data, style: TextStyle(fontSize:12)),)
                        ],
                      ),
                                            
                      trailing: Row(   
                        mainAxisSize: MainAxisSize.min,       
                        children: <Widget>[

                      
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: (){
                              Navigator.pushNamed(context, '/alterarsuaspesquisas');
                            },
                          ),
                          
                        ]
                    ));
                  }
                );
            }
        }
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cadastroPesquisa", arguments: null);
        },
        ),

    );
  }
}

