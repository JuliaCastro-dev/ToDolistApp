import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/model/todo.dart';
import 'package:flutter_application_1/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  final _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    for (ToDo todoItem in todosList)
                      ToDoItem(
                        todo: todoItem,
                        onDeleteItem: _deleteToDoItem,
                        onToDoChanged: _handleToDoChange,
                      ),
                  ],
                ),
              )
            ]),
          ),
          
        ],
      ),
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: const EdgeInsets.only(bottom: 20, right: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintText: 'Nova tarefa',
                border: InputBorder.none,
              ),
            ),
          )),
          Container(
            margin: const EdgeInsets.only(bottom: 20, right: 5),
            child: IconButton(
                icon: const Icon(Icons.add, color: tdbLUE, size: 35),
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                onPressed: () {
                  _addToDoItem(_todoController.text);
                },
                style: IconButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    minimumSize: const Size(50, 50)),
                color: Colors.white),
          )
        ],
      ),
        
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
        title: 
          Text(
          'Tarefas',
            textDirection: TextDirection.rtl,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: tdbLUE, fontSize: 25),
          )
  
    );
  }
}
