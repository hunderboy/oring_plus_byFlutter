import 'dart:io';

import 'package:oring_project_ex1/models/oring_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'oringTable'; // 테이블 명


// ignore: slash_for_doc_comments

/// DBHelper 클래스는 Flutter 에서 Local DB 에 접근하기 위한 인스턴스를 제공하며, 동시에 초기화를 도와주는 서비스 클래스 입니다.
class DBHelper {

  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() => _db;

  // 해당 변수에 데이터 베이스 정보를 담을 것 이다.
  static Database _database;

  // 생성된 데이터베이스가 있다면 _database 를 리턴하고
  // 없다면 데이터베이스를 생성하여 리턴한다.
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  // 데이터 베이스 초기화 함수
  initDB() async {
    // path_provider 패키지의 getApplicationDocumentsDirectory() 를 이용하여 모바일 장치 내부의
    //시스템파일의 경로를 찾고 DB 의 이름과 경로를 조합 합니다.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'oringPlus.db');

    // openDatabase 에서 위에서 만든 해당 경로 와 db version 그리고 db 에서 실행 할 쿼리를 삽입 합니다.
    // 그리고 여기서 해당 클래스의 변수를 생성하여 외부에서 db 라는 변수로 접근하게 만들었지만
    // Factory 를 사용하면 클래스 이름으로 접근 가능하게 변경이 가능합니다.
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async { //  ListNo INT 인가? REAL 인가... 실제로 데이터 넣을때 확인해봐야 함. 제대로 들어가는지
        await db.execute('''
        CREATE TABLE $tableName ( 
        
          ListNo INTEGER PRIMARY KEY, 
          STANDARD TEXT,
          No TEXT,
          ID REAL,
          tolernce_id REAL,
          CS REAL,
          tolernce_cs REAL
     
       ''');
      },
    );
  }

  // CREATE
  createData(Oring oring) async {
    final db = await database;
    var res = await db.insert(tableName, oring.toJson());
    return res;
  }

  // READ
  getTodo(int id) async {
    final db = await database;
    var res = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Oring.fromJson(res.first) : Null;
  }

  // READ ALL DATA
  Future<List<Oring>> getAllTodos() async {
    final db = await database;
    var res = await db.query(tableName);
    List<Oring> list =
        res.isNotEmpty ? res.map((c) => Oring.fromJson(c)).toList() : [];
    return list;
  }

//  // Update Todo
//  updateTodo(Oring oring) async {
//    final db = await database;
//    var res = await db.update(tableName, oring.toJson(),
//        where: 'id = ?', whereArgs: [oring.id]);
//    return res;
//  }

}
