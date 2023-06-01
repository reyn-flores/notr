part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState._({
    this.themeMode = ThemeMode.light,
  });

  const ThemeState.initial() : this._();

  ThemeState initialize(ThemeMode themeMode) {
    return copyWith(themeMode: themeMode);
  }

  ThemeState toggle() {
    var newThemeMode =
        (themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    addThemeToSF(newThemeMode);
    return copyWith(themeMode: newThemeMode);
  }

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState._(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [themeMode];
}

addThemeToSF(ThemeMode themeMode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("themeMode", themeMode.name);
}

getThemeValueSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("themeMode");
}
