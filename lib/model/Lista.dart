import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  final String nome;
  final String item;
  final double qtd;
  final bool status;

  const Lista({Key? key, required this. nome, required this.item, required this.qtd, required this.status}) : super(key: key);

  @override
  _ListaState createState() => _ListaState(nome: nome, item: item, qtd: qtd, status: status);
}

class _ListaState extends State<Lista> {
  final String nome;
  final String item;
  final double qtd;
  final bool status;

  // Controladores dos campos de texto
  TextEditingController itemController = TextEditingController();
  TextEditingController qtdController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  // Construtor
  _ListaState({ required this. nome, required this.item, required this.qtd, required this.status});

  @override
  Widget build(BuildContext context) {
    // Seu código de construção de widget aqui
    throw UnimplementedError();
  }
}
