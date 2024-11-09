import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:papyros/core/utils/api_service.dart';
import 'package:papyros/features/authentication/sign_in/data/data_source/sign_in_data_source.dart';
import 'package:papyros/features/authentication/sign_in/data/repos/sign_in_repo_impl.dart';
import 'package:papyros/features/authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:papyros/features/authentication/sign_up/data/data_source/sign_up_data_source.dart';
import 'package:papyros/features/authentication/sign_up/data/repos/sign_up_repo_impl.dart';
import 'package:papyros/features/authentication/sign_up/domain/use_cases/sign_up_usecase.dart';

final getIt = GetIt.instance;
void setupServiceLoactor() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<SignInUseCase>(SignInUseCase(
      signInRepo: SignInRepoImpl(
          signInDataSource:
              SignInDataSourceImpl(apiService: getIt.get<ApiService>()))));
  getIt.registerSingleton<SignUpUsecase>(SignUpUsecase(
      signUpRepo: SignUpRepoImpl(
          signUpDataSource:
              SignUpDataSourceImpl(apiService: getIt.get<ApiService>()))));
}
