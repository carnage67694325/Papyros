import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/theme_helper.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';
import 'package:papyros/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:papyros/features/search/presentation/view/widget/search_sug_item.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  Timer? _debounce;
  final _controller = TextEditingController();
  List<SearchFieldListItem<UserEntity>> _suggestions = [];

  Future<List<SearchFieldListItem<UserEntity>>> _onSearchChanged(
      String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (query.isNotEmpty) {
        context.read<SearchCubit>().search(query: query);
      }
    });

    return _suggestions;
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
          final users = state.userProfileEntityList;
          setState(() {
            _suggestions = users
                .map(
                  (user) => SearchFieldListItem<UserEntity>(
                    '${user.firstName} ${user.lastName}',
                    item: user,
                    child: Container(
                      height: 250.h,
                      alignment: Alignment.centerLeft,
                      child: SearchSugItem(
                        userId: user.id!,
                        name: user.userName!,
                        profileImage: user.profileImage!,
                      ),
                    ), // pass full user object here
                    // Optional: you can add a widget here to show profile image in suggestions if SearchField supports it
                  ),
                )
                .toList();
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: SearchField<UserEntity>(
          controller: _controller,
          onSearchTextChanged: _onSearchChanged,
          suggestions: _suggestions,
          searchInputDecoration: SearchInputDecoration(
            fillColor: AppColors.lightGreyBlue.withAlpha(75),
            filled: true,
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: ThemeHelper.isDarkMode(context)
                  ? AppColors.lightPeach
                  : Colors.black,
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
