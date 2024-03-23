import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:intl/intl.dart';
import 'package:notr/src/presentation/cubits/notes/notes_cubit.dart';

class EditNotePage extends StatefulWidget {
  final Note? note;

  const EditNotePage({super.key, this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notesCubit = BlocProvider.of<NotesCubit>(context);

    titleController.text = widget.note?.title ?? '';
    contentController.text = widget.note?.content ?? '';

    int editedAt = widget.note?.editedAt ?? 0;
    DateTime lastEditedAt = editedAt != 0
        ? DateTime.fromMillisecondsSinceEpoch(editedAt)
        : DateTime.now();

    String format = 'E, MMMM d hh:mm aaa';
    String lastEditedAtFormatted = DateFormat(format).format(lastEditedAt);

    bool textFieldChangeDetected = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
          ),
          onPressed: () {
            if (widget.note == null) {
              if (titleController.text.isNotEmpty ||
                  contentController.text.isNotEmpty) {
                // create a note if title or content are empty
                Note note = Note(
                  title: titleController.text,
                  content: contentController.text,
                  createdAt: lastEditedAt.millisecondsSinceEpoch,
                  editedAt: lastEditedAt.millisecondsSinceEpoch,
                );
                notesCubit.saveNote(note: note);
              }
            } else {
              if (textFieldChangeDetected && widget.note != null) {
                // update an existing note when changes are made
                var updatedNote = widget.note!.copyWith(
                  title: titleController.text,
                  content: contentController.text,
                  editedAt: DateTime.now().millisecondsSinceEpoch,
                );
                notesCubit.updateNote(note: updatedNote);
              }
            }
            context.pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.note != null) {
                Note note = widget.note!;
                notesCubit.removeNote(note: note);
                context.pop();
              }
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextFormField(
              maxLines: null,
              controller: titleController,
              onChanged: (value) => textFieldChangeDetected = true,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Add title',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              lastEditedAtFormatted,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextFormField(
                maxLines: null,
                controller: contentController,
                onChanged: (value) => textFieldChangeDetected = true,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'Add content',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
