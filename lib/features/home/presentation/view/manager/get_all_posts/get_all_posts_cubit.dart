import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_posts_state.dart';

class GetAllPostsCubit extends Cubit<GetAllPostsState> {
  GetAllPostsCubit() : super(GetAllPostsInitial());
}
