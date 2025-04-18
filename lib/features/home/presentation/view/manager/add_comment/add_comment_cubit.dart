import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/home/data/models/comments.dart';
import 'package:papyros/features/home/domain/entities/comment_entity.dart';
import 'package:papyros/features/home/domain/use_cases/add_comments_use_case.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.addCommentUseCase) : super(AddCommentInitial());
  final AddCommentUseCase addCommentUseCase;
  Future<void> addComment({
    required String token,
    required CommentModel comment,
    required String postId,
  }) async {
    emit(AddCommentLoading());

    final result = await addCommentUseCase.call(comment, token, postId);

    result.fold(
      (failure) => emit(AddCommentFailure(failure.errMessage)),
      (_) => emit(AddCommentSuccess()),
    );
  }
}
