import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';
import 'package:papyros/features/profile_viewer/domain/repo/profile_viewer_repo.dart';

class ProfileViewUsecase {
  final ProfileViewerRepo profileRepository;

  ProfileViewUsecase(this.profileRepository);

  Future<Either<Failure, UserViewer>> call(String userId) async {
    return await profileRepository.getUserProfile(userId);
  }
}
