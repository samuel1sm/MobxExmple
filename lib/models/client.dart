// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String? name;
  @observable
  String? email;
  @observable
  String? cpf;

  @action
  changeName(String newName) => name = newName;
  @action
  changeEmail(String newEmail) => email = newEmail;
  @action
  changeCpf(String newCpf) => cpf = newCpf;
}
