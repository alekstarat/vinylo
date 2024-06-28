import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vinylo/theme.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final ThemeManager _themeManager;

  SettingsBloc({
    required ThemeManager themeManager
  }) : _themeManager = themeManager, super(SettingsInitial()) {
    on<ToggleThemeEvent>((event, emit) {
      final bool d = _themeManager.isDarkmodeOn;
      _themeManager.changeTheme(event.context);
      if (d) {
        emit(LightThemeState());
      } else {
        emit(DarkThemeState());
      }
    });
  }
}
