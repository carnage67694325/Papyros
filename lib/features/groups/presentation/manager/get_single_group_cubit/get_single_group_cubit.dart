import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/groups/data/models/single_group_model/single_group_model.dart';
import 'package:papyros/features/groups/domain/use_case/get_single_group_usecase.dart';

part 'get_single_group_state.dart';

class GetSingleGroupCubit extends Cubit<GetSingleGroupState> {
  final GetSingleGroupUsecase getSingleGroupUsecase;
  GetSingleGroupCubit(this.getSingleGroupUsecase)
      : super(GetSingleGroupInitial());
  Future<void> getSingleGroup({required String groupId}) async {
    emit(GetSingleGroupLoading());
    final String? token = await PrefasHandelr.getAuthToken();
    var response =
        await getSingleGroupUsecase.call(token: token!, groupId: groupId);
    response.fold((failure) {
      return emit(GetSingleGroupFailure(errMessage: failure.errMessage));
    }, (group) {
      return emit(GetSingleGroupSuccess(group: group));
    });
  }
}
