import 'package:mobx/mobx.dart';
import 'package:todo_mobx/stores/todo_store.dart';
part 'list_store.g.dart';

// ignore: library_private_types_in_public_api
class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {

  @observable
  String newTodoTitle = '';

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  ObservableList<TodoStore> todoList = ObservableList();

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = '';
  }

}