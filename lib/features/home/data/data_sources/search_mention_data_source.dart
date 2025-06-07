import 'package:papyros/features/home/data/models/mention_model/mention_model.dart';

abstract class SearchMentionDataSource {
  Future<MentionModel> searchMention(
      {required String query, required String token});
}
