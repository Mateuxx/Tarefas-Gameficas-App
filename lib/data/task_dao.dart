import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:alura_flutter_curso_1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //Criação das Colunas da Tabela
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print("Iniciando o save:");
    //abertura do db
    final Database db = await getDatabase();
    //verficar se a tarefa ja existe
    var itemExists = await find(tarefa.nome);
    if (itemExists.isEmpty) {
      print("A tarefa não existia");
      return await db.insert(
          _tablename, values); // se não existir criar um e salvar no db
    } else {
      //caso o item exista...
      print('A tarefa ja existia');
      return await db.update(
        _tablename,
        values,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database db = await getDatabase(); //retorna um map
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print('Procurando dados no bando de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("Acessando toList()...");
    final List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa =
          Task(linha[_name], linha[_difficulty], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando o find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa], // onde o valor for igual ao nome da tarefa
    );
    print('Tarefa Encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {}
}
