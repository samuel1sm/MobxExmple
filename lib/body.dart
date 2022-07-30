import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'controller.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

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
    final controller = GetIt.I.get<Controller>();

    return Padding(
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
    );
  }
}
