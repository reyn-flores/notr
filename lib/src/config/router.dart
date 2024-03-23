import 'package:go_router/go_router.dart';
import 'package:notr/src/domain/models/note.dart';
import 'package:notr/src/presentation/views/edit_note_page.dart';
import 'package:notr/src/presentation/views/home_page.dart';
import 'package:notr/src/presentation/views/splash_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      builder: (context, state) {
        return const SplashPage();
      },
      routes: [
        GoRoute(
          path: Routes.home,
          name: Routes.home,
          builder: (context, state) {
            return const HomePage();
          },
          routes: [
            GoRoute(
              path: Routes.edit,
              name: Routes.edit,
              builder: (context, state) {
                return EditNotePage(
                  note: state.extra as Note?,
                );
              },
            )
          ],
        ),
      ],
    )
  ],
);

class Routes {
  static const initial = '/';
  static const home = 'home';
  static const edit = 'edit';
}
