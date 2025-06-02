import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';
import 'package:papyros/features/profile_viewer/domain/usecase/profile_view_usecase.dart';

part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<ProfileViewState> {
  final ProfileViewUsecase profileViewUsecase;
  ProfileViewCubit(this.profileViewUsecase) : super(ProfileViewInitial());
  Future<void> getUserProfile({required String userId}) async {
    emit(ProfileViewLoading());
    var response = await profileViewUsecase.call(userId);
    response.fold(
      (failure) {
        return emit(ProfileViewFailure(errMessage: failure.errMessage));
      },
      (userViewer) {
        return emit(ProfileViewSuccess(userViewer: userViewer));
      },
    );
  }
}
