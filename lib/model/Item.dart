import 'package:flutter/material.dart';

class ItemLista extends StatefulWidget {
  final String item;
  final double qtd;
  final bool status;

  const ItemLista({Key? key, required this.item, required this.qtd, required this.status}) : super(key: key);

  @override
  _ItemListaState createState() => _ItemListaState();
}

class _ItemListaState extends State<ItemLista> {
  // Controladores dos campos de texto
  late TextEditingController itemController;
  late TextEditingController qtdController;
  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    itemController = TextEditingController(text: widget.item);
    qtdController = TextEditingController(text: widget.qtd.toString());
    statusController = TextEditingController(text: widget.status ? 'Sim' : 'Não');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.item),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quantidade: ${widget.qtd}'),
          Text('Status: ${widget.status ? 'Sim' : 'Não'}'),
        ],
      ),
    );
  }
}