import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:notr/src/presentation/views/edit_note_page.dart';
import 'package:notr/src/presentation/views/home_page.dart';
import 'package:notr/src/presentation/views/splash_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(routes: [
  AutoRoute(
    page: SplashPage,
    initial: true,
  ),
  AutoRoute(
    page: HomePage,
  ),
  AutoRoute(
    page: EditNotePage,
  )
])
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
