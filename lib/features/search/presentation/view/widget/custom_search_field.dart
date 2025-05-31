import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/profile_management/domain/entities/user_profile_entity.dart';
import 'package:papyros/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  Timer? _debounce;
  final _controller = TextEditingController();
  List<SearchFieldListItem<String>> _suggestions = [];

  Future<List<SearchFieldListItem<String>>> _onSearchChanged(
      String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<SearchCubit>().search(query: query);
      }
    });

    return _suggestions; // Just return current suggestions for compatibility
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        } else if (state is SearchSuccess) {
          // Here we expect a List<UserProfileEntity>
          final users = state
              .userProfileEntityList; // <-- You must update SearchSuccess to expose a list
          setState(() {
            _suggestions = users
                .map(
                  (user) => SearchFieldListItem<String>(
                    '${user.firstName} ${user.lastName}',
                    item: user.userName,
                  ),
                )
                .toList();
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: SearchField<String>(
          controller: _controller,
          onSearchTextChanged: _onSearchChanged,
          suggestions: _suggestions,
          searchInputDecoration: SearchInputDecoration(
            fillColor: AppColors.lightGreyBlue.withAlpha(75),
            filled: true,
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.lightPeach),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.lightPeach),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
