import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'oringTable'; // 테이블 명


// ignore: slash_for_doc_comments

/// DBHelper 클래스는 Flutter 에서 Local DB 에 접근하기 위한 인스턴스를 제공하며, 동시에 초기화를 도와주는 서비스 클래스 입니다.
class DBHelper {

  /**
   * Dart 에서 싱글톤 클래스를 만들기 위한 방법은 기본적으로 생성자를 private 상태로 만들고 이루어 집니다.
      추가로 static 변수를 활용한 제공 또는 별도의 getter 함수를 이용하는 방법, 마지막으로 Factory 를 이용하는 방법이 있습니다.
      위 클래스에서는 static 변수로 해당 클래스의 인스턴스를 제공 합니다.

   ** Dart 에서는 변수나 함수 앞 _ 를 붙이면 자동으로 private 상태로 인식 합니다.
   */

  /// 그리고 여기서 해당 클래스의 변수를 생성하여 외부에서 db 라는 변수로 접근하게 만들었지만
  /// Factory 를 사용하면 클래스 이름으로 접근 가능하게 변경이 가능합니다.
  /// 아무래도 Flutter 에서는 클래스이름으로 접근하는게 익숙하니 이부분도 변경 해 봅시다.
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
    String path = join(documentsDirectory.path, 'oringplus.db');

    // openDatabase 에서 위에서 만든 해당 경로 와 db version 그리고 db 에서 실행 할 쿼리를 삽입 합니다.
    // 그리고 여기서 해당 클래스의 변수를 생성하여 외부에서 db 라는 변수로 접근하게 만들었지만
    // Factory 를 사용하면 클래스 이름으로 접근 가능하게 변경이 가능합니다.
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE $tableName (
        
          ListNo REAL PRIMARY KEY,
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

//  // CREATE
//  createData(Todo todo) async {
//    final db = await database;
//    var res = await db.insert(tableName, todo.toJson());
//    return res;
//  }
//
//  // READ
//  getTodo(int id) async {
//    final db = await database;
//    var res = await db.query(tableName, where: 'id = ?', whereArgs: [id]);
//    return res.isNotEmpty ? Todo.fromJson(res.first) : Null;
//  }
//
//  // READ ALL DATA
//  Future<List<Todo>> getAllTodos() async {
//    final db = await database;
//    var res = await db.query(tableName);
//    List<Todo> list =
//        res.isNotEmpty ? res.map((c) => Todo.fromJson(c)).toList() : [];
//    return list;
//  }
//
//  // Update Todo
//  updateTodo(Todo todo) async {
//    final db = await database;
//    var res = await db.update(tableName, todo.toJson(),
//        where: 'id = ?', whereArgs: [todo.id]);
//    return res;
//  }

}
