import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/widget_pesquisa.dart';


class PesquisaWidget extends StatefulWidget{
  @override
  _PesquisaWidgetState createState() => _PesquisaWidgetState();
  
}
class _PesquisaWidgetState extends State<PesquisaWidget>{
  var db=FirebaseFirestore.instance;
  List<Pesquisa> cadastropesquisa = List(); //ouvir todos os eventos que podem ocorrer na colecao
  StreamSubscription<QuerySnapshot>listen;
  @override
  void initState(){
    super.initState();
    listen?.cancel();
    listen =db.collection("cadastropesquisa").snapshots().listen((res) {
      
      setState((){

        cadastropesquisa = res.docs.map(
          (e) => Pesquisa.fromMap(e.data(),e.id)).toList();
        
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
        stream: db.collection("cadastropesquisa").snapshots(),
        builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Center(child: Text('Erro de conexao'));
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default: 
                return ListView.builder(
                  itemCount: cadastropesquisa.length,
                  
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(cadastropesquisa[index].nome, style: TextStyle(fontSize:18)),
                      subtitle: Text(cadastropesquisa[index].descricao, style: TextStyle(fontSize:12)),
                      
                      trailing: Row(   
                        mainAxisSize: MainAxisSize.min,       
                        children: <Widget>[

                      
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (){
                              //apagar um documento
                              //db.collection("cadastropesquisa").doc(cadastropesquisa[index].id).delete();
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              //apagar um documento
                              db.collection("cadastropesquisa").doc(cadastropesquisa[index].id).delete();
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

