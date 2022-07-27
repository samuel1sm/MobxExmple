import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_flutterando/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();

  TextField _textField({
    required String labelText,
    String? Function()? errorText,
    onChanged,
  }) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Observer(builder: (_) {
              return _textField(
                labelText: "name",
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return _textField(
                labelText: "email",
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return _textField(
                labelText: "cpf",
                onChanged: controller.client.changeCpf,
                errorText: controller.validateCpf,
              );
            }),
            const SizedBox(
              height: 50,
            ),
            Observer(builder: (_) {
              return FloatingActionButton(
                onPressed: controller.isValid ? () {} : null,
                child: const Text('Salvar'),
              );
            })
          ],
        ),
      ),
    );
  }
}
