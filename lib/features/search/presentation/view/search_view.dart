import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papyros/features/search/data/data_source/search_data_source_imp.dart';
import 'package:papyros/features/search/data/repo/search_repo_imp.dart';
import 'package:papyros/features/search/domain/usecase/search_usecase.dart';
import 'package:papyros/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:papyros/features/search/presentation/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(SearchUsecase(
              searchRepo: SearchRepoImp(
                  searchDataSource: SearchDataSourceImp(dio: Dio())))),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
