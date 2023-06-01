// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    EditNotePageRoute.name: (routeData) {
      final args = routeData.argsAs<EditNotePageRouteArgs>(
          orElse: () => const EditNotePageRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: EditNotePage(
          key: args.key,
          note: args.note,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashPageRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        RouteConfig(
          EditNotePageRoute.name,
          path: '/edit-note-page',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: '/',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [EditNotePage]
class EditNotePageRoute extends PageRouteInfo<EditNotePageRouteArgs> {
  EditNotePageRoute({
    Key? key,
    Note? note,
  }) : super(
          EditNotePageRoute.name,
          path: '/edit-note-page',
          args: EditNotePageRouteArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'EditNotePageRoute';
}

class EditNotePageRouteArgs {
  const EditNotePageRouteArgs({
    this.key,
    this.note,
  });

  final Key? key;

  final Note? note;

  @override
  String toString() {
    return 'EditNotePageRouteArgs{key: $key, note: $note}';
  }
}
