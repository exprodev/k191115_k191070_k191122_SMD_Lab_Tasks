import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoList _todoList = TodoList();
  final TextEditingController _textEditingController = TextEditingController();

  void _addTodo() {
    setState(() {
      final title = _textEditingController.text;
      if (title.isNotEmpty) {
        _todoList.add(Todo(title: title));
        _textEditingController.clear();
      }
    });
  }

  void _toggleTodoState(int index) {
    setState(() {
      final todo = _todoList.todos[index];
      _todoList.update(todo, isDone: !todo.isDone);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _todoList.remove(_todoList.todos[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'New Todo',
                hintText: 'Enter a new todo...',
              ),
              onSubmitted: (value) => _addTodo(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.todos.length,
              itemBuilder: (context, index) {
                final todo = _todoList.todos[index];
                return CheckboxListTile(
                  value: todo.isDone,
                  title: Text(todo.title),
                  onChanged: (value) => _toggleTodoState(index),
                  secondary: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Todo {
  final String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

class TodoList {
  final List<Todo> todos = [];

  void add(Todo todo) {
    todos.add(todo);
  }

  void remove(Todo todo) {
    todos.remove(todo);
  }

  void update(Todo todo, {required bool isDone}) {
    todo.isDone = isDone;
  }
}
