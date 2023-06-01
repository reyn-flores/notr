part of 'notes_cubit.dart';

enum NoteStateStatus { loading, success }

class NoteState extends Equatable {
  final NoteStateStatus status;
  final List<Note> notes;

  const NoteState._({
    this.status = NoteStateStatus.loading,
    this.notes = const [],
  });

  const NoteState.initial() : this._();

  NoteState asLoading() {
    return copyWith(
      status: NoteStateStatus.loading,
    );
  }

  NoteState asSuccess(List<Note> notes) {
    return copyWith(
      status: NoteStateStatus.success,
      notes: notes,
    );
  }

  NoteState copyWith({
    NoteStateStatus? status,
    List<Note>? notes,
  }) {
    return NoteState._(
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object> get props => [status, notes];
}
