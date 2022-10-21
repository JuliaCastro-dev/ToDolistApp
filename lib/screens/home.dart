import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/widgets/todo_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final todosList = ToDo.todoList();
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 50,
                      ),
                      child: const Text('Tarefas',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w800)),
                    ),
                    for (ToDo todoItem in todosList)
                      ToDoItem(
                        todo: todoItem,
                        onDeleteItem: todoItem.isDone,
                        onToDoChanged: () => {},
                      ),
                  ],
                ),
              )
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                              0,
                              0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Nova tarefa', border: InputBorder.none),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            hintText: 'Pesquisar',
            hintStyle: TextStyle(color: tdGrey),
            prefixIcon: Icon(
              Icons.search,
              color: tdGrey,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25,
            )),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Text(
            'ToDoFlutter',
            textDirection: TextDirection.rtl,
            style: TextStyle(fontWeight: FontWeight.bold, color: tdBlack),
          )
        ],
      ),
    );
  }
}
