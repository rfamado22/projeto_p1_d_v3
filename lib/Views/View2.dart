import 'package:flutter/material.dart';
import 'View1.dart';
import 'View3.dart';

class Tela2View extends StatefulWidget {
  const Tela2View({Key? key}) : super(key: key);

  @override
  State<Tela2View> createState() => _Tela2ViewState();
}

class _Tela2ViewState extends State<Tela2View> {
  void _mostrarInformacoesApp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações sobre o aplicativo'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tema do aplicativa é Lista de compras.'),
                Text('O objetivo é auxiliar usuário com listas, permitindo criação e manutenção de registros.'),
                Text('Desenvolvido por: Rafaela Fernandes Amado'),
                Text('Email de contato: rafaela.amado@fatec.sp.gov.br'),
                // Adicione outras informações que desejar
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _abrirTela3() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tela3View()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _mostrarInformacoesApp,
              child: Text('Abrir informações'),
            ),
            SizedBox(width: 20),
            OutlinedButton(
              onPressed: _abrirTela3,
              child: Text('Listas'),
            ),
          ],
        ),
      ),
    );
  }
}