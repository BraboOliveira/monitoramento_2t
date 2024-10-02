import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/aula.dart';
import '../models/aula_acao.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  static Database? _database;

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'auto_escola.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Criar a tabela para Aula
    await db.execute('''
      CREATE TABLE aulas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alunoNome TEXT,
        instrutorNome TEXT,
        horario TEXT,
        kmInicial REAL,
        kmFinal REAL,
        finalizada INTEGER
      )
    ''');

    // Criar a tabela para AulaAcao (ações durante a aula)
    await db.execute('''
      CREATE TABLE acoes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        aulaId INTEGER,
        timestamp TEXT,
        freioLigado INTEGER,
        setaDireita INTEGER,
        setaEsquerda INTEGER,
        freioMao INTEGER,
        cintoSeguranca INTEGER,
        FOREIGN KEY (aulaId) REFERENCES aulas (id) ON DELETE CASCADE
      )
    ''');
  }

  // Métodos para gerenciar Aulas
  Future<void> insertAula(Aula aula) async {
    final db = await database;
    await db.insert('aulas', aula.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Aula>> getAulas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('aulas');
    return List.generate(maps.length, (i) {
      return Aula.fromMap(maps[i]);
    });
  }

  // Métodos para gerenciar Ações de Aula
  Future<void> insertAcao(AulaAcao acao) async {
    final db = await database;
    await db.insert('acoes', acao.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<AulaAcao>> getAcoesPorAula(int aulaId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('acoes', where: 'aulaId = ?', whereArgs: [aulaId]);
    return List.generate(maps.length, (i) {
      return AulaAcao.fromMap(maps[i]);
    });
  }
}
