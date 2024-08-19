import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:alura_flutter_curso_1/screens/forms_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        leading: Icon(Icons.add_task),
      ),
      body: Container(
        color: const Color.fromARGB(255, 208, 221, 237),
        child: ListView(
          //Recebe a lista de tasks
          children: TaskInherited.of(context).taskLists,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormsScreen(),
            ),
          );
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
