import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/features/groups/presentation/view/widgets/create_group_dialog.dart';

class GroupsHeader extends StatefulWidget {
  const GroupsHeader({
    super.key,
  });

  @override
  State<GroupsHeader> createState() => _GroupsHeaderState();
}

class _GroupsHeaderState extends State<GroupsHeader> {
  void _showCreateGroupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CreateGroupDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Groups',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.lightPeach,
              ),
            ),

            SizedBox(height: 16.h),

            // Create Group Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.buildLinearGradient(context),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: _showCreateGroupDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Create New Group',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
