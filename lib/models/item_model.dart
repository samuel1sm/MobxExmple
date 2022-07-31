// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  @observable
  String? title;

  @observable
  bool? check;

  _ItemModelBase.defaultValues() {
    title = "teste";
    check = false;
  }

  _ItemModelBase({
    required this.title,
    required this.check,
  });

  @action
  setTitle(String? value) => title = value;

  @action
  setCheck(bool? value) => check = value;
}
