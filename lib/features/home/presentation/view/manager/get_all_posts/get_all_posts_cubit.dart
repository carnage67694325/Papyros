import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/home/domain/entities/posts_entity.dart';
import 'package:papyros/features/home/domain/use_cases/get_all_posts_usecase.dart';

part 'get_all_posts_state.dart';

class GetAllPostsCubit extends Cubit<GetAllPostsState> {
  GetAllPostsCubit(this.getPostsUsecase) : super(GetAllPostsInitial());
  final GetPostsUsecase getPostsUsecase;
  Future<void> getAllPosts() async {
    emit(GetAllPostsLoading());
    var response = await getPostsUsecase.call();
    response.fold((failure) {
      return emit(GetAllPostsFailure(errMessage: failure.errMessage));
    }, (List<PostsEntity> posts) {
      return emit(GetAllPostsSuccess(posts: posts));
    });
  }
}
