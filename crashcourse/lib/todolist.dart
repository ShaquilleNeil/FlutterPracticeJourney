import 'package:flutter/material.dart';
import 'package:crashcourse/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;//to toggle the item
  final Function(int index) toggle;

  const TodoList({super.key, required this.todos, required this.toggle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: todo.isCompleted ? const Color.fromARGB(255, 0, 0, 0) : todo.priority.color,
                width: 2,
              ),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: todo.isCompleted ? Colors.grey : Colors.black,
                decoration: todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              todo.description,
              style: TextStyle(
                fontSize: 12,
                color: todo.isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            trailing: GestureDetector(
              onTap: () => toggle(index),
              child: Icon(
                todo.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: todo.isCompleted ? Colors.green : Colors.grey,
                
              ),
            ),
          ),
        );
      },
    );
  }
}