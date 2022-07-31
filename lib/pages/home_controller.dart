import 'package:mobx/mobx.dart';
import 'package:mobx_flutterando/models/item_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
  ].asObservable();

  @computed
  int get totalChecked => listItems.length;

  @action
  addItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  removeItem(ItemModel model) {
    listItems.remove(model);
  }
}
