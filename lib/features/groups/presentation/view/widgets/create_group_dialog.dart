import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:papyros/core/animations/app_loading_animation.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/groups/data/models/groups/cover_images.dart';
import 'package:papyros/features/groups/data/models/groups/group.dart';
import 'package:papyros/features/groups/presentation/manager/add_group_cubit/add_group_cubit.dart';

class CreateGroupDialog extends StatefulWidget {
  const CreateGroupDialog({super.key});

  @override
  State<CreateGroupDialog> createState() => _CreateGroupDialogState();
}

class _CreateGroupDialogState extends State<CreateGroupDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? _frontImage;
  File? _backgroundImage;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(bool isFrontImage) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          if (isFrontImage) {
            _frontImage = File(image.path);
          } else {
            _backgroundImage = File(image.path);
          }
        });
      }
    } catch (e) {
      errorSnackBar(context, 'Error picking image: $e');
    }
  }

  void _createGroup() {
    if (_nameController.text.trim().isEmpty) {
      errorSnackBar(context, 'Please enter a group name');
      return;
    }

    final group = Group(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      coverImages: CoverImages(
        frontImage: _frontImage?.path,
        backgroundImage: _backgroundImage?.path,
      ),
    );

    context.read<AddGroupCubit>().addGroup(group: group);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddGroupCubit, AddGroupState>(
      listener: (context, state) {
        if (state is AddGroupSuccess) {
          Navigator.of(context).pop();
          successSnackBar(context, 'Group created successfully!');
        } else if (state is AddGroupFailure) {
          errorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: AbsorbPointer(
            absorbing: state is AddGroupLoading,
            child: Stack(
              children: [
                _buildDialogContent(),
                if (state is AddGroupLoading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black26,
                      child: const Center(child: AppLoadingAnimation()),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create New Group',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightPeach,
                )),
            SizedBox(height: 20.h),
            TextField(
              controller: _nameController,
              decoration: _inputDecoration('Group Name', Icons.group),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: _inputDecoration('Description', Icons.description),
            ),
            SizedBox(height: 20.h),
            Text('Group Images',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 12.h),
            _imagePickerSection(isFront: true, image: _frontImage),
            SizedBox(height: 12.h),
            _imagePickerSection(isFront: false, image: _backgroundImage),
            SizedBox(height: 24.h),
            _actionButtons(),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintText: 'Enter $label'.toLowerCase(),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      prefixIcon: Icon(icon),
      alignLabelWithHint: true,
    );
  }

  Widget _imagePickerSection({required bool isFront, required File? image}) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => _pickImage(isFront),
        borderRadius: BorderRadius.circular(8),
        child: image != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 20),
                        onPressed: () => setState(() {
                          if (isFront) {
                            _frontImage = null;
                          } else {
                            _backgroundImage = null;
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(isFront ? Icons.image : Icons.wallpaper,
                      size: 40.sp, color: Colors.grey),
                  SizedBox(height: 8.h),
                  Text(
                    isFront
                        ? 'Tap to select front image'
                        : 'Tap to select background image',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        SizedBox(width: 12.w),
        Container(
          decoration: BoxDecoration(
            gradient: AppColors.buildLinearGradient(context),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ElevatedButton(
            onPressed: _createGroup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Create Group',
                style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
