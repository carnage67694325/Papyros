import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';
import 'package:papyros/features/search/domain/usecase/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUsecase searchUsecase;
  SearchCubit(this.searchUsecase) : super(SearchInitial());
  Future<void> search({required String query}) async {
    emit(SearchLoading());
    var response = await searchUsecase.call(query);
    response.fold(
      (failure) {
        return emit(SearchFailure(errMessage: failure.errMessage));
      },
      (userList) {
        return emit(SearchSuccess(userProfileEntityList: userList));
      },
    );
  }
}
