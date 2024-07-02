import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notr/src/config/app_router.dart';
import 'package:notr/src/config/router.dart';
import 'package:notr/src/config/theme.dart';
import 'package:notr/src/domain/repositories/database_repository.dart';
import 'package:notr/src/locator.dart';
import 'package:notr/src/presentation/cubits/notes/notes_cubit.dart';
import 'package:notr/src/presentation/cubits/theme/theme_cubit.dart';
import 'package:notr/src/utils/constants/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(
            locator<DatabaseRepository>(),
          )..getAllNotes(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..initialze(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: Themings.lightTheme,
            darkTheme: Themings.darkTheme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: appTitle,
          );
        },
      ),
    );
  }
}
