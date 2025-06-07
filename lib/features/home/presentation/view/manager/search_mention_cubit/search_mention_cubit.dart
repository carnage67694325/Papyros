import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/data/models/mention_model/datum.dart';
import 'package:papyros/features/home/domain/use_cases/search_mention_usecase.dart';

part 'search_mention_state.dart';

class SearchMentionCubit extends Cubit<SearchMentionState> {
  final SearchMentionUsecase searchUsecase;
  SearchMentionCubit(this.searchUsecase) : super(SearchMentionInitial());
  Future<void> searchMention({required String query}) async {
    emit(SearchMentionLoading());
    final token = await PrefasHandelr.getAuthToken();
    var response = await searchUsecase.call(
      query: query,
      token: token!,
    );
    response.fold(
      (failure) {
        return emit(SearchMentionFailure(errMessage: failure.errMessage));
      },
      (userList) {
        return emit(SearchMentionSuccess(userToMention: userList));
      },
    );
  }
}
