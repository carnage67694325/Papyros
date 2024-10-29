import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'change_local_state.dart';

class ChangeLocalCubit extends Cubit<ChangeLocalState> {
  ChangeLocalCubit() : super(ChangeLocalInitial());
  void changeLocal(bool isEnglish) {
    if (isEnglish) {
      emit(ChangeLocalCurrent(currentLocale: const Locale('ar')));
    } else {
      emit(ChangeLocalCurrent(currentLocale: const Locale('en')));
    }
  }
}
