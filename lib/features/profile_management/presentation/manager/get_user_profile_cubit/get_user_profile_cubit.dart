import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/profile_management/domain/use_cases/get_user_use_case.dart';
import 'package:papyros/features/profile_management/presentation/view/widgets/user_data_profile_info.dart';

part 'get_user_profile_state.dart';

class GetUserProfileCubit extends Cubit<GetUserProfileState> {
  GetUserProfileCubit(this.getUserProfileUseCase)
      : super(GetUserProfileInitial());
  final GetUserProfileUseCase getUserProfileUseCase;
  Future<void> getUserProfile() async {
    emit(GetUserProfileLoading());
    var response = await getUserProfileUseCase.call();
    response.fold(
      (failure) {
        return emit(GetUserProfileFailure(errMessage: failure.errMessage));
      },
      (userProfileEntity) {
        return emit(
            GetUserProfileSuccess(userProfileEntity: userProfileEntity));
      },
    );
  }
}
