import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  Future<void> initialze() async {
    var currentTheme = await getThemeValueSF();
    if (currentTheme == ThemeMode.light.name) {
      emit(state.initialize(ThemeMode.light));
    } else {
      emit(state.initialize(ThemeMode.dark));
    }
  }

  Future<void> toggleTheme() async {
    emit(state.toggle());
  }
}
