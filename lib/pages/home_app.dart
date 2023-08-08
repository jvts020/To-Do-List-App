import 'package:flutter/material.dart';
import 'package:to_do_list_app/util/dialog_box.dart';
import 'package:to_do_list_app/util/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  // Lista de tarefas
  List<Map<String, dynamic>> toDoList = [
    {"taskName": "fazer a lista", "taskCompleted": false},
    {"taskName": "fazer tutorial", "taskCompleted": false},
  ];

  // Checkbox foi clicado
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index]["taskCompleted"] = value;
    });
  }

  void savedNewTask() {
    setState(() {
      toDoList.add({
        "taskName": _controller.text,
        "taskCompleted": false,
      });
    });
    Navigator.of(context).pop();
  }

// Criar nova tarefa

  void createNewTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogBox(
            controller: _controller,
            onSave: savedNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF380DF7),
      appBar: AppBar(
        title: const Text('LISTA DE TAREFAS'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF1D02A5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFF1D02A5),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index]["taskName"],
            taskCompleted: toDoList[index]["taskCompleted"],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
