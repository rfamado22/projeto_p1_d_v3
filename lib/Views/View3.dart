import 'package:flutter/material.dart';
import 'package:projeto_p1/model/Lista.dart';

class Tela3View extends StatefulWidget {
  const Tela3View({Key? key}) : super(key: key);

  @override
  _Tela3ViewState createState() => _Tela3ViewState();
}

class _Tela3ViewState extends State<Tela3View> {
  late TextEditingController nomeController;
  late TextEditingController itemController;
  late TextEditingController qtdController;
  late TextEditingController statusController;

  // Lista Dinâmica de objetos da classe Lista
  List<Lista> dados = [];

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    itemController = TextEditingController();
    qtdController = TextEditingController();
    statusController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(
                labelText: 'Nome da Lista',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                isCollapsed: true, // Define que a caixa de entrada ocupa o menor espaço possível
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: itemController,
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(
                labelText: 'Item',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                isCollapsed: true, // Define que a caixa de entrada ocupa o menor espaço possível
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: qtdController,
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                isCollapsed: true, // Define que a caixa de entrada ocupa o menor espaço possível
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: statusController,
              style: TextStyle(fontSize: 32),
              decoration: InputDecoration(
                labelText: 'Comprado',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                isCollapsed: true, // Define que a caixa de entrada ocupa o menor espaço possível
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Adicionando um novo item à lista
                  dados.add(Lista(
                    nome: nomeController.text,
                    item: itemController.text,
                    qtd: double.parse(qtdController.text),
                    status: statusController.text == 'Sim' ? true : false,
                  ));
                });
              },
              child: Text('Salvar'),
            ),
            SizedBox(height: 20),
            // Lista de itens salvos
            Expanded(
              child: ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        dados[index].nome,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        title: Text(dados[index].item),
                        subtitle: Text('Quantidade: ${dados[index].qtd}\nStatus: ${dados[index].status ? 'Sim' : 'Não'}'),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}