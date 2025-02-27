import 'package:papyros/core/endpoints/endpiont.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/chat_bot/data/data_source/send_prompt_data_source.dart';

class SendPromptDataSourceImpl implements SendPromptDataSource {
  final ApiService apiService;

  SendPromptDataSourceImpl({required this.apiService});
  @override
  Future<void> sendPrompt({required String prompt}) async {
    await apiService.postPrompt(
        endPoint: Endpiont.chatPotEndpoint, body: {'user_input': prompt});
  }
}
