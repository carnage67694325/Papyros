import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';

abstract class ProfileViewer {
  Future<UserViewer> getUserProfile(String userId);
}
