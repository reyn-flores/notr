import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notr/src/config/app_router.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:notr/src/presentation/cubits/notes/notes_cubit.dart';
import 'package:notr/src/presentation/cubits/theme/theme_cubit.dart';
import 'package:notr/src/presentation/widgets/note_card.dart';
import 'package:notr/src/utils/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state.themeMode == ThemeMode.light) {
                  return GestureDetector(
                    onTap: () {
                      themeCubit.toggleTheme();
                    },
                    child: const Icon(
                      Icons.light_mode_rounded,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      themeCubit.toggleTheme();
                    },
                    child: const Icon(
                      Icons.dark_mode_rounded,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotesCubit, NoteState>(
        builder: (context, state) {
          switch (state.status) {
            case NoteStateStatus.loading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case NoteStateStatus.success:
              return Column(
                children: [
                  _buildNotesList(context, state.notes),
                ],
              );
            default:
              return const SizedBox();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          appRouter.push(EditNotePageRoute());
        },
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '+ Add note',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotesList(BuildContext context, List<Note> notes) {
    if (notes.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'No notes yet.',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: MasonryGridView.builder(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          itemCount: notes.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes[index],
            );
          },
        ),
      );
    }
  }
}
