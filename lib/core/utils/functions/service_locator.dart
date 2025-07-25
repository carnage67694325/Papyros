import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_in/data/data_source/sign_in_data_source.dart';
import 'package:papyros/features/authentication/sign_in/data/repos/sign_in_repo_impl.dart';
import 'package:papyros/features/authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:papyros/features/authentication/sign_up/data/data_source/sign_up_data_source.dart';
import 'package:papyros/features/authentication/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:papyros/features/authentication/sign_up/domain/use_cases/sign_up_usecase.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/data_source/verfiy_otp_data_source.dart';
import 'package:papyros/features/authentication/verfiy_otp/data/repos/verfiy_otp_repo_imp.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/use_cases/verfiy_otp_use_case.dart';
import 'package:papyros/features/chat_bot/data/data_source/send_prompt_data_source_impl.dart';
import 'package:papyros/features/chat_bot/data/repositories/chat_bot_repo_impl.dart';
import 'package:papyros/features/chat_bot/domain/use_cases/chat_bot_send_prompt_UseCase.dart';
import 'package:papyros/features/groups/data/data_source/groups_data_source_imp.dart';
import 'package:papyros/features/groups/data/repos/groups_rep_imp.dart';
import 'package:papyros/features/groups/domain/use_case/get_groups_usecase.dart';
import 'package:papyros/features/home/data/data_sources/add_like_data_source_imp.dart';
import 'package:papyros/features/home/data/data_sources/add_post_impl.dart';
import 'package:papyros/features/home/data/data_sources/commentdauimp.dart';
import 'package:papyros/features/home/data/data_sources/get_posts_imp.dart';
import 'package:papyros/features/home/data/repositories/CommentRepoimp.dart';
import 'package:papyros/features/home/data/repositories/posts_entity_imp.dart';
import 'package:papyros/features/home/domain/use_cases/add_comments_use_case.dart';
import 'package:papyros/features/home/domain/use_cases/add_like_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/get_all_posts_usecase.dart';
import 'package:papyros/features/home/domain/use_cases/get_recommand_posts_usecase.dart';
import 'package:papyros/features/messaging/data/data_source/messaging_data_source_imp.dart';
import 'package:papyros/features/messaging/data/repos/messaging_repo_imp.dart';
import 'package:papyros/features/messaging/domain/use_cases/get_contact_use_case.dart';
import 'package:papyros/features/profile_management/data/data_sources/profile_mangment_imp.dart';
import 'package:papyros/features/profile_management/data/repositories/profile_managment_repo_imp.dart';
import 'package:papyros/features/profile_management/domain/use_cases/get_user_use_case.dart';
import 'package:papyros/features/profile_management/domain/use_cases/update_use_case.dart';

final getIt = GetIt.instance;
void setupServiceLoactor() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AddLikeUscase>(AddLikeUscase(
      getPostsRepoimp: GetPostsRepoimp(
    GetPostsImp(
      Dio(),
    ),
    AddPostImpl(dio: Dio()),
    AddLikeImp(apiService: ApiService(Dio())),
  )));
  getIt.registerSingleton<SignInUseCase>(SignInUseCase(
      signInRepo: SignInRepoImpl(
          signInDataSource:
              SignInDataSourceImpl(apiService: getIt.get<ApiService>()))));
  getIt.registerSingleton<SignUpUsecase>(SignUpUsecase(
      signUpRepo: SignUpRepoImpl(
          signUpDataSource:
              SignUpDataSourceImpl(apiService: getIt.get<ApiService>()))));
  getIt.registerSingleton<VerfiyOtpUseCase>(VerfiyOtpUseCase(VerfiyOtpRepoImp(
      VerfiyOtpDataSourceImpl(apiService: getIt.get<ApiService>()))));
  getIt.registerSingleton<GetUserProfileUseCase>(GetUserProfileUseCase(
    ProfileRepositoryImpl(
      remoteDataSource: ProfileRemoteDataSourceImpl(dio: Dio()),
    ),
  ));
  getIt.registerSingleton<UpdateUserProfileUseCase>(
      UpdateUserProfileUseCase(ProfileRepositoryImpl(
    remoteDataSource: ProfileRemoteDataSourceImpl(
      dio: Dio(),
    ),
  )));
  getIt.registerSingleton<ChatBotSendPromptUseCase>(
    ChatBotSendPromptUseCase(
      ChatBotRepoImpl(
        sendPromptDataSource: SendPromptDataSourceImpl(dio: Dio()),
      ),
    ),
  );
  getIt.registerSingleton<GetPostsUsecase>(
    (GetPostsUsecase(
      GetPostsRepoimp(
        GetPostsImp(
          Dio(),
        ),
        AddPostImpl(dio: Dio()),
        AddLikeImp(
          apiService: ApiService(Dio()),
        ),
      ),
    )),
  );
  getIt.registerSingleton<GetRecommandPostsUsecase>(
    (GetRecommandPostsUsecase(
      postrepo: GetPostsRepoimp(
        GetPostsImp(
          Dio(),
        ),
        AddPostImpl(dio: Dio()),
        AddLikeImp(
          apiService: ApiService(Dio()),
        ),
      ),
    )),
  );
  getIt.registerSingleton<AddCommentUseCase>(AddCommentUseCase(
      CommentRepositoryImpl(
          remoteDataSource: CommentRemoteDataSourceImpl(dio: Dio()))));
  getIt.registerSingleton<GetContactUseCase>(
    GetContactUseCase(
      messagingRepo: MessagingRepoImp(
        dataSource: MessagingDataSourceimp(
          dio: Dio(),
        ),
      ),
    ),
  );
  getIt.registerSingleton<GetGroupsUsecase>(GetGroupsUsecase(
      groupRepo:
          GroupsRepoImp(groupsDataSource: GroupsDataSourceImp(dio: Dio()))));
}
