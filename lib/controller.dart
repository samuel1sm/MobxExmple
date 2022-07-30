import 'package:mobx/mobx.dart';
import 'package:mobx_flutterando/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String? validateName() {
    if (client.name == null || (client.name?.isEmpty ?? false)) {
      return "este campo é obrigatorio";
    }

    return null;
  }

  String? validateEmail() {
    if (client.email == null || (client.email?.isEmpty ?? false)) {
      return "este campo é obrigatorio";
    }

    return null;
  }

  dispose() {}
}
