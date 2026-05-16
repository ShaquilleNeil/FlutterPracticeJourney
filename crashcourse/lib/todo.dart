
import 'package:flutter/material.dart';

class Todo {
  String title;
  String description;
  Priority priority;
  bool isCompleted;

  Todo({
    required this.title,
    required this.description,
    required this.priority,
    this.isCompleted = false,
  });
}

enum Priority { 
  low(color: Colors.green, title: 'Low'), 
  medium(color: Colors.yellow, title: 'Medium'), 
  high(color: Colors.red, title: 'High'); 

  const Priority({required this.color, required this.title});

  final Color color;
  final String title;
  }