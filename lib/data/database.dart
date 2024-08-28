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
      db.execute(tableSql);
    },
    version: 1,
  ); // Start o db
}

//Criação das Colunas da Tabela
const String tableSql = 'CREATE TABLE $_tablename('
    '$_name TEXT, '
    '$_difficulty INTEGER, '
    '$_image TEXT)';

const String _tablename = 'taskTable';
const String _name = 'name';
const String _difficulty = 'difficulty';
const String _image = 'image';

