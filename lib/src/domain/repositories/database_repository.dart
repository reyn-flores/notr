import 'package:notr/src/domain/models/note.dart';

abstract class DatabaseRepository {
  Future<List<Note>> getSavedNotes();

  Future<void> saveNote(Note note);

  Future<void> removeNote(Note note);

  Future<void> updateNote(Note note);
}
