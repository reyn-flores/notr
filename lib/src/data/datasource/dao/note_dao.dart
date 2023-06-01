import 'package:floor/floor.dart';
import 'package:notr/src/domain/models/note.dart';

import '../../../utils/constants/strings.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM $notesTableName ORDER BY editedAt DESC')
  Future<List<Note>> getAllNotes();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateNote(Note note);
}
