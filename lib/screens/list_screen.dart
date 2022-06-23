import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_mobx/stores/login_store.dart';
import 'package:todo_mobx/widgets/custom_icon_button.dart';
import 'package:todo_mobx/widgets/custom_text_field.dart';

import '../stores/list_store.dart';
import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);


  @override
  // ignore: library_private_types_in_public_api
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final ListStore listStore = ListStore();

  final TextEditingController textEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: (){
                        //listen false necessário quando o método so for chamado uma vez.
                        Provider.of<LoginStore>(context, listen: false).logout();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>const LoginScreen())
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              controller: textEditingController,
                              hint: 'Tarefa',
                              onChanged: listStore.setNewTodoTitle,
                              suffix: listStore.isFormValid ? CustomIconButton(
                                radius: 32,
                                iconData: Icons.add,
                                onTap: () {
                                  listStore.addTodo();
                                  textEditingController.clear();
                                  /* SOMENTE NECESSÁRIO EM VERSOES ANTIGAS ONDE ERROS ACONTECEM
                                  COMANDO ABAIXO CHAMA A FUNCAO INTERNA DEPOIS Q OS WIDGETS SAO RENDERIZADOS
                                  WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => textEditingController.clear()
                                  );
                                  */
                                },
                              ) : null
                            );
                          }
                        ),
                        const SizedBox(height: 8,),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              return ListView.separated(
                                itemCount: listStore.todoList.length,
                                itemBuilder: (_, index){

                                  final todo = listStore.todoList[index];
                                  return Observer(
                                    builder: (_) {
                                      return ListTile(
                                        title: Text(
                                          todo.title,
                                          style: TextStyle(
                                            decoration: todo.done ?
                                              TextDecoration.lineThrough : null,
                                            color: todo.done ?
                                              Colors.grey : Colors.black
                                          ),
                                        ),
                                        onTap: todo.toggleDone,
                                      );
                                    },
                                  );
                                },
                                separatorBuilder: (_, __){
                                  return const Divider();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}