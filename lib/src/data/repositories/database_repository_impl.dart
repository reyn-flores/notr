import 'package:notr/src/data/datasource/app_database.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:notr/src/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<Note>> getSavedNotes() async {
    return _appDatabase.noteDao.getAllNotes();
  }

  @override
  Future<void> removeNote(Note note) async {
    return _appDatabase.noteDao.deleteNote(note);
  }

  @override
  Future<void> saveNote(Note note) async {
    return _appDatabase.noteDao.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    return _appDatabase.noteDao.updateNote(note);
  }
}
