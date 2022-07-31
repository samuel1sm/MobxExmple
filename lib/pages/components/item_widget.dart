import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutterando/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final Function() removeClicked;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.removeClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.title ?? "Titulo"),
          leading: Checkbox(
            value: item.check,
            onChanged: item.setCheck,
          ),
          trailing: IconButton(
            onPressed: removeClicked,
            icon: const Icon(Icons.remove_circle),
            color: Colors.red,
          ),
        );
      },
    );
  }
}
