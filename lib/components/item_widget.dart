import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Título'),
      leading: Checkbox(
        value: true,
        onChanged: (value) {},
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.remove_circle),
        color: Colors.red,
      ),
    );
  }
}
