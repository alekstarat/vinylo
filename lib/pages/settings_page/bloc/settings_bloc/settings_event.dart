part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends SettingsEvent{
  final BuildContext context;
  final bool input;

  const ToggleThemeEvent(this.input, this.context);
}
