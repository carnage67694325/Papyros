import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/home/domain/use_cases/add_like_usecase.dart';

part 'add_like_state.dart';

class AddLikeCubit extends Cubit<AddLikeState> {
  final AddLikeUscase addLikeUseCase;
  AddLikeCubit(this.addLikeUseCase) : super(AddLikeInitial());
  Future<void> addLike({
    required String token,
    required String postId,
  }) async {
    emit(AddLikeLoading());

    final result = await addLikeUseCase.call(token, postId);

    result.fold(
      (failure) => emit(AddLikeFailure(failure.errMessage)),
      (_) => emit(AddLikeSuccess()),
    );
  }
}
