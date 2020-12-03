import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xyzpesquisaclinica/login.dart';
import 'package:xyzpesquisaclinica/cadastro.dart';
import 'package:xyzpesquisaclinica/menu.dart';
import 'package:xyzpesquisaclinica/pesquisa.dart';
import 'package:xyzpesquisaclinica/cadastropesquisa.dart';
import 'package:xyzpesquisaclinica/sobrenos.dart';
import 'package:xyzpesquisaclinica/sobreodesenvolvedor.dart';
import 'package:xyzpesquisaclinica/suaspesquisas.dart';
import 'package:xyzpesquisaclinica/faleconosco.dart';
import 'package:xyzpesquisaclinica/alterarsuaspesquisas.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

  runApp(MaterialApp(   


    debugShowCheckedModeBanner: false,
    title: 'ListView',
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginWidget(),
      '/menu': (context) => MenuWidget(),
      '/pesquisas': (context) => PesquisaWidget(),
      //'/recuperacaodesenha': (context) => RecuperaSenhaWidget(),
      '/cadastro': (context) =>CadastroWidget(),
      '/cadastroPesquisa': (context) =>CadastroPesquisaWidget(),
      '/sobrenos': (context) => SobreNosWidget(),
      '/sobreodesenvolvedor': (context) => SobreoDesenvolvedorWidget(),
      '/suaspesquisas': (context) => SuasPesquisasWidget(),
      '/faleconosco': (context) => FaleConoscoWidget(),
      '/alterarsuaspesquisas': (context) => AlterarsuasPesquisaWidget( ),
      


    },
  ));  
}