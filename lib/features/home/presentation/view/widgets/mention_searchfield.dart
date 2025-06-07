import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/features/home/data/models/mention_model/datum.dart';
import 'package:papyros/features/home/presentation/view/manager/search_mention_cubit/search_mention_cubit.dart';
import 'package:papyros/features/home/presentation/view/widgets/mention_sug_item.dart';
import 'package:searchfield/searchfield.dart';

class MentionSearchField extends StatefulWidget {
  final TextEditingController postController;

  const MentionSearchField({super.key, required this.postController});

  @override
  State<MentionSearchField> createState() => _MentionSearchFieldState();
}

class _MentionSearchFieldState extends State<MentionSearchField> {
  Timer? _debounce;
  final _searchController = TextEditingController();
  List<SearchFieldListItem<Datum>> _suggestions = [];

  Future<List<SearchFieldListItem<Datum>>> _onSearchChanged(
      String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (query.isNotEmpty) {
        context.read<SearchMentionCubit>().searchMention(query: query);
      }
    });
    return _suggestions;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchMentionCubit, SearchMentionState>(
      listener: (context, state) {
        if (state is SearchMentionFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        } else if (state is SearchMentionSuccess) {
          final users = state.userToMention;
          setState(() {
            _suggestions = users
                .map(
                  (user) => SearchFieldListItem<Datum>(
                    user.userName ?? '',
                    item: user,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: MentionSugItem(
                        name: user.userName ?? '',
                        profileImage: user.profileImage ?? '',
                        userId: user.id ?? '',
                        onMentionSelected: (userName) {
                          final text = widget.postController.text;
                          final selection = widget.postController.selection;

                          // fallback: if cursor position is invalid, append to end
                          final insertAt =
                              (selection.start >= 0 && selection.end >= 0)
                                  ? selection.start
                                  : text.length;

                          final newText = text.replaceRange(
                            insertAt,
                            insertAt,
                            '@$userName ',
                          );

                          widget.postController.text = newText;
                          widget.postController.selection =
                              TextSelection.collapsed(
                            offset: insertAt +
                                userName.length +
                                2, // 1 for "@" + 1 for space
                          );
                        },
                      ),
                    ),
                  ),
                )
                .toList();
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: SearchField<Datum>(
          controller: _searchController,
          suggestions: _suggestions,
          onSearchTextChanged: _onSearchChanged,
          searchInputDecoration: SearchInputDecoration(
            fillColor: AppColors.lightGreyBlue.withAlpha(75),
            filled: true,
            hintText: 'Mention someone',
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
