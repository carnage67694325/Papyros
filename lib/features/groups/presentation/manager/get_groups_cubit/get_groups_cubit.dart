import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/groups/data/models/groups/groups.dart';
import 'package:papyros/features/groups/domain/use_case/get_groups_usecase.dart';

part 'get_groups_state.dart';

class GetGroupsCubit extends Cubit<GetGroupsState> {
  final GetGroupsUsecase getGroupsUsecase;
  GetGroupsCubit(this.getGroupsUsecase) : super(GetGroupsInitial());
  Future<void> getGroups() async {
    emit(GetGroupsLoading());
    final String? token = await PrefasHandelr.getAuthToken();
    var response = await getGroupsUsecase.call(token: token!);
    response.fold((failure) {
      return emit(GetGroupsFailure(errMessage: failure.errMessage));
    }, (Groups groups) {
      return emit(GetGroupsSuccess(groups: groups));
    });
  }
}
