import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/domain/usecase/follow_usecase.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowUsecase followUsecase;
  FollowCubit(this.followUsecase) : super(FollowInitial());
  Future<Either<Failure, void>> follow(String userId) async {
    emit(FollowLoading());
    final result = await followUsecase.call(userId: userId);
    return result.fold(
      (failure) {
        emit(FollowFailure(errMessage: failure.errMessage));
        return Left(failure);
      },
      (success) {
        emit(FollowSuccess());
        return Right(success);
      },
    );
  }
}
