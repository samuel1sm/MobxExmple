import 'package:flutter/material.dart';
import 'package:mobx_flutterando/controller.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() => runApp(const AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Controller>(
            create: (_) => Controller(),
            dispose: (_, controller) => controller.dispose(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Mobx',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const HomePage(),
        ));
  }
}
