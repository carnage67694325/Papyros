part of 'change_local_cubit.dart';

@immutable
sealed class ChangeLocalState {}

final class ChangeLocalInitial extends ChangeLocalState {}

final class ChangeLocalCurrent extends ChangeLocalState {
  final Locale currentLocale;

  ChangeLocalCurrent({required this.currentLocale});
}
