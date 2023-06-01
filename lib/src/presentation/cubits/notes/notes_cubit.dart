import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:notr/src/domain/repositories/database_repository.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteState> {
  final DatabaseRepository _databaseRepository;

  NotesCubit(this._databaseRepository) : super(const NoteState.initial());

  Future<void> getAllNotes() async {
    emit(await _getAllNotes());
  }

  Future<void> removeNote({required Note note}) async {
    await _databaseRepository.removeNote(note);
    emit(await _getAllNotes());
  }

  Future<void> saveNote({required Note note}) async {
    await _databaseRepository.saveNote(note);
    emit(await _getAllNotes());
  }

  Future<void> updateNote({required Note note}) async {
    await _databaseRepository.updateNote(note);
    emit(await _getAllNotes());
  }

  Future<NoteState> _getAllNotes() async {
    final notes = await _databaseRepository.getSavedNotes();
    return state.asSuccess(notes);
  }
}
