import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/domain/use_case/add_group_usecase.dart';

part 'add_group_state.dart';

class AddGroupCubit extends Cubit<AddGroupState> {
  final AddGroupUsecase addGroupUsecase;
  AddGroupCubit(this.addGroupUsecase) : super(AddGroupInitial());
  Future<void> addGroup({required Group group}) async {
    emit(AddGroupLoading());
    final String? token = await PrefasHandelr.getAuthToken();
    var response = await addGroupUsecase.call(token: token!, group: group);
    response.fold((failure) {
      return emit(AddGroupFailure(errMessage: failure.errMessage));
    }, (group) {
      return emit(AddGroupSuccess());
    });
  }
}
