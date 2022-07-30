import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'components/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Adicionar item"),
            content: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo Item',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('Savar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const TextField(
        decoration: InputDecoration(hintText: "Pesquisa ..."),
      )),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return const ItemWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
