import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/item_model.dart';
import 'components/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  var model = ItemModel.defaultValues();

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Adicionar item"),
            content: TextField(
              onChanged: model.setTitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Novo Item',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  controller.addItem(model);
                  Navigator.pop(context);
                },
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
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Observer(builder: (_) {
                return Text("${controller.totalChecked}");
              }))
        ],
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: controller.listItems.length,
          itemBuilder: (_, index) {
            var item = controller.listItems[index];
            return ItemWidget(
                item: item,
                removeClicked: () {
                  controller.removeItem(item);
                });
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
