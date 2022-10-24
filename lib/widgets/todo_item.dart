import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(todo);
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
          onTap: (() {
            onToDoChanged(todo);
          }),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdbLUE,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontSize: 18,
                color: tdBlack,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            height: 45,
            width: 35,
            alignment: AlignmentDirectional.center,
            child: IconButton(
              color: Colors.white,
              iconSize: 25,
              icon: const Icon(
                Icons.delete,
                color: tdRed,
              ),
              onPressed: (() {
                onDeleteItem(todo.id);
              }),
            ),
          )),
    );
  }
}
