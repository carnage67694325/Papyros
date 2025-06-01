import 'package:dartz/dartz.dart';
import 'package:papyros/core/errors/failure.dart';
import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';

abstract class ProfileViewerRepo {
  Future<Either<Failure, UserViewer>> getUserProfile();
}
