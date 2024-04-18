import 'package:flutter/material.dart';
import 'View2.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key}) : super(key: key);

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool isLoggedIn = false;

  void _recuperarSenha() {
    String userEmail = emailController.text;
    if (userEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Informe o email!'),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Recuperar Senha'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Um email foi enviado com sua senha.'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tela2View()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: senhaController,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'senha',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  minimumSize: Size(200, 40),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final String userEmail = emailController.text;
                    final String userSenha = senhaController.text;

                    if (userEmail == 'usuario@fatec.sp.gov.br' &&
                        userSenha == 'senha') {
                      setState(() {
                        isLoggedIn = true;
                      });

                      // Navegar para Tela2 após o login bem-sucedido
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tela2View()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Credenciais inválidas!'),
                        ),
                      );
                    }
                  }
                },
                child: Text('Enviar'),
              ),
              SizedBox(height: 30),
              if (isLoggedIn)
                Text(
                  'Login bem-sucedido!',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              OutlinedButton(
                onPressed: _recuperarSenha,
                child: Text('Recuperar Senha'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}