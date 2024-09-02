import 'package:alura_flutter_curso_1/data/task_dao.dart';
import 'package:flutter/material.dart';
import '../components/tasks.dart';
import 'forms_screen.dart';

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
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                });
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        //Widget responsavel parad
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          //snapshot - Responsavel pelos dados do db
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            //só constroi as tarefas que estão aparecendo na tela - Bom para muitos dados
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
                break;
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando"),
                    ],
                  ),
                );
                break;
              case ConnectionState.done:

                /// Se tiver dados:
                if (snapshot.hasData && items != null) {
                  /// Se Empty for diferente de zero
                  if (items.isNotEmpty) {
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task tarefa = items[index];
                        });
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          "Não Há nehuma tarefa!",
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return const Text('Error ao carregar Tarefas');
                break;
            }
            return const Text("Erro Desconhecido");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),

            ///Quando voltar de formScreen ele reconstroi a tela no qual
            ///foi mudado o banco de dados.
          ).then((onValue) => setState(() {
                print("Recarregandoa  tela inicial");
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
