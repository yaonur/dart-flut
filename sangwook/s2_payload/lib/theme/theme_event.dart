part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent{
  final int randInt;

  const ChangeThemeEvent({
    required this.randInt,
});

  @override
  String toString() {
    return 'ChangeThemeEvent{randInt: $randInt}';
  }
  @override
  List<Object> get props => [randInt];

}