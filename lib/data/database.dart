import 'package:alura_flutter_curso_1/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Tipo Future: Depois precisamos que ele seja carregado
/// para não esperar que essa ação termine para dar sequencia no app.
Future<Database> getDatabase() async {
  //Local aonde o db vai ser salvo

  final String path = join(
      await getDatabasesPath(), 'task,db'); //(localAondeSalvar, nome do db)
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    version: 1, // Versão do db
  ); // Start o db
}
