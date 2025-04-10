import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/home/data/models/Posts.dart';
import 'package:papyros/features/home/domain/use_cases/add_post_usecase.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final AddPostUseCase addPostUseCase;

  AddPostCubit(this.addPostUseCase) : super(AddPostInitial());

  Future<void> addPost({
    required String token,
    required PostModel post,
  }) async {
    emit(AddPostLoading());

    final result = await addPostUseCase(token: token, post: post);

    result.fold(
      (failure) => emit(AddPostFailure(failure.errMessage)),
      (_) => emit(AddPostSuccess()),
    );
  }
}
