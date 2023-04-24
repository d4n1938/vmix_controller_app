import 'package:sqflite/sqflite.dart';
import 'package:vmix_controller_app/pages/models/address_info.dart';

final String tableAddress = 'Address';
final String columnId = 'id';
final String columnIp = 'ip';
final String columnPort = 'port';

class AddressHelper {
  static Database? _database;
  static AddressHelper? _addressHelper;

  AddressHelper._createInstance();
  factory AddressHelper() {
    if (_addressHelper == null) {
      _addressHelper = AddressHelper._createInstance();
    }
    return _addressHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = "$dir/address.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS $tableAddress (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnIp TEXT,
            $columnPort TEXT
          )
        ''');
      },
    );
    return database;
  }

  void insertAddress(AddressInfo info) async {
    var db = await database;
    var result = await db.insert(tableAddress, info.toJson());
  }

  Future getLastData() async {
    var db = await database;
    final result = await db.rawQuery(
        'SELECT $columnIp, $columnPort FROM $tableAddress ORDER BY $columnId DESC LIMIT ?',
        [1]);
    return result.first;
  }
}
