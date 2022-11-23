import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();

    contatos.add(Contato(
        nome: 'Isabella', telefone: '+11999999999', tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: 'Guilherme',
        telefone: '+11999999999',
        tipo: ContatoType.CELULAR));

    contatos.add(Contato(
        nome: 'Ana', telefone: '+11999999999', tipo: ContatoType.FAVORITO));

    contatos.add(Contato(
        nome: 'Matheus', telefone: '+11999999999', tipo: ContatoType.TRABALHO));

    contatos.add(Contato(
        nome: 'Cinthia', telefone: '+11999999999', tipo: ContatoType.CASA));

    contatos.add(Contato(
        nome: 'Perondi', telefone: '+11999999999', tipo: ContatoType.CELULAR));
    contatos.add(Contato(
        nome: 'Ricardo', telefone: '+11999999999', tipo: ContatoType.WHATSAPP));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                  leading: CircleAvatar(
                    child: ContatoHelper.getIconByContatoType(contato.tipo),
                    backgroundColor: Color.fromARGB(255, 89, 157, 235),
                  ),
                  title: Text(contato.nome),
                  subtitle: Text(contato.telefone),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () => {},
                  ));
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: contatos.length));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA, WHATSAPP }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.CELULAR:
        ;
        return Icon(Icons.phone_android, color: Colors.grey[700]);
      case ContatoType.TRABALHO:
        ;
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.FAVORITO:
        ;
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.CASA:
        ;
        return Icon(Icons.home, color: Colors.purple[600]);
      case ContatoType.WHATSAPP:
        return Icon(Icons.call, color: Colors.green[700]);
    }
  }
}
