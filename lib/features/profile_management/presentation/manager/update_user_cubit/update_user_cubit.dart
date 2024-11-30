import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/profile_management/domain/use_cases/update_use_case.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.updateUserProfileUseCase) : super(UpdateUserInitial());
  final UpdateUserProfileUseCase updateUserProfileUseCase;
  Future<void> updateUserProfile(
      UserProfileEntity profile, String token) async {
    emit(UpdateUserLoading());
    var response = await updateUserProfileUseCase.call(profile, token);
    response.fold((failure) {
      return emit(UpdateUserFailure(errMessage: failure.errMessage));
    }, (success) {
      return emit(UpdateUserSuccess());
    });
  }
}
