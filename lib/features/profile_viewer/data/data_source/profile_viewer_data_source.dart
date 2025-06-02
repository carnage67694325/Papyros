import 'package:papyros/features/profile_viewer/data/model/user_viewer/user_viewer.dart';

abstract class ProfileViewerDataSource {
  Future<UserViewer> getUserProfile(String userId);
  Future<void> follow({required String token, required String userId});
}
