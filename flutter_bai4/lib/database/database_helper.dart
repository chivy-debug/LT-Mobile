import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Thêm thư viện SharedPreferences
import '../models/note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._(); // Singleton pattern
  Database? _database;
  final _store = intMapStoreFactory.store('notes'); // Store tên "notes"

  DatabaseHelper._(); // Private constructor

  // Getter để lấy database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Khởi tạo Database
  Future<Database> _initDB() async {
    final dbFactory = databaseFactoryWeb; // IndexedDB
    return await dbFactory.openDatabase('notes.db'); // Tên database
  }

  // Lấy thông tin người dùng từ SharedPreferences
  Future<String?> _getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username'); // Lấy tên người dùng từ SharedPreferences
  }

  // Thêm ghi chú
  Future<int> insertNote(Note note) async {
    final db = await database;
    final createdBy = await _getCurrentUser(); // Lấy tên người dùng
    final noteWithUser = note.copyWith(createdBy: createdBy); // Thêm thông tin người tạo vào ghi chú
    return await _store.add(db, noteWithUser.toMap());
  }

  // Lấy danh sách ghi chú
  Future<List<Note>> getNotes() async {
    final db = await database;
    final snapshots = await _store.find(
      db,
      finder: Finder(sortOrders: [
        SortOrder('createdAt', false), // Sắp xếp giảm dần theo createdAt
      ]),
    );
    return snapshots.map((snapshot) {
      return Note.fromMap(snapshot.value)..id = snapshot.key;
    }).toList();
  }

  // Xóa ghi chú
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await _store.delete(
      db,
      finder: Finder(filter: Filter.byKey(id)),
    );
  }

  // Cập nhật ghi chú
  Future<int> updateNote(Note note) async {
    final db = await database;
    final createdBy = await _getCurrentUser(); // Lấy tên người dùng
    final noteWithUser = note.copyWith(createdBy: createdBy); // Thêm thông tin người tạo vào ghi chú
    return await _store.update(
      db,
      noteWithUser.toMap(),
      finder: Finder(filter: Filter.byKey(note.id)),
    );
  }

  // Lấy danh sách ghi chú của một người dùng
  Future<List<Note>> getNotesByUser(String username) async {
    final db = await database;
    final snapshots = await _store.find(
      db,
      finder: Finder(
        filter: Filter.equals('createdBy', username), // Lọc ghi chú theo người tạo
        sortOrders: [SortOrder('createdAt', false)], // Sắp xếp theo createdAt
      ),
    );
    return snapshots.map((snapshot) {
      return Note.fromMap(snapshot.value)..id = snapshot.key;
    }).toList();
  }
}
