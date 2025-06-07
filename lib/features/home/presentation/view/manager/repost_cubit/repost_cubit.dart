import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/Prefernces/Shaerdperefeancses.dart';
import 'package:papyros/features/home/domain/use_cases/repost_usecase.dart';

part 'repost_state.dart';

class RepostCubit extends Cubit<RepostState> {
  final RepostUsecase repostUseCase;
  RepostCubit(this.repostUseCase) : super(RepostInitial());
  Future<void> repost({
    required String postId,
  }) async {
    emit(RepostLoading());
    final token = await PrefasHandelr.getAuthToken();
    final result = await repostUseCase.call(token: token!, postId: postId);

    result.fold(
      (failure) => emit(RepostFaiulre(failure.errMessage)),
      (_) => emit(RepostSuccess()),
    );
  }
}
