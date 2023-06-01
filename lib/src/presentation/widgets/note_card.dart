import 'package:flutter/material.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:intl/intl.dart';
import 'package:notr/src/config/app_router.dart';
import 'package:notr/src/presentation/cubits/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);

    DateTime lastEditedAt =
        DateTime.fromMillisecondsSinceEpoch(note.editedAt ?? 0);

    String format = 'E, MMMM d hh:mm aaa';
    String lastEditedAtFormatted = DateFormat(format).format(lastEditedAt);

    return GestureDetector(
      onTap: () {
        appRouter.push(EditNotePageRoute(note: note));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeCubit.state.themeMode == ThemeMode.light
              ? Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(2, 2),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      note.title ?? '',
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                note.content ?? '',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                lastEditedAtFormatted,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
