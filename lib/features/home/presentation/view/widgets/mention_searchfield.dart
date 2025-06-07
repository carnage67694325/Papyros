import 'dart:async';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/search/domain/entity/user_entity.dart';
import 'package:papyros/features/search/presentation/view/widget/search_sug_item.dart';

class MentionSearchField extends StatefulWidget {
  final List<UserEntity> initialSuggestions;
  final Function(String)? onQueryChanged;

  const MentionSearchField({
    super.key,
    this.initialSuggestions = const [],
    this.onQueryChanged,
  });

  @override
  State<MentionSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<MentionSearchField> {
  Timer? _debounce;
  final _controller = TextEditingController();
  List<SearchFieldListItem<UserEntity>> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _buildSuggestions(widget.initialSuggestions);
  }

  void _buildSuggestions(List<UserEntity> users) {
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
            ),
          ),
        )
        .toList();
  }

  Future<List<SearchFieldListItem<UserEntity>>> _onSearchChanged(
      String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (widget.onQueryChanged != null && query.isNotEmpty) {
        widget.onQueryChanged!(query);
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
    return Padding(
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
    );
  }
}
