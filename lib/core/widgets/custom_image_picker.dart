// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/styles.dart';

class CustomImagePicker extends StatefulWidget {
  final Function(File?)? onImageSelected;
  final String? initialImagePath;
  final double size;
  final bool enableEdit;
  final String emptyStateText;
  final IconData cameraIcon;
  final IconData galleryIcon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderRadius;
  final bool showBorder;
  final Color? borderColor;
  final double borderWidth;

  const CustomImagePicker({
    super.key,
    this.onImageSelected,
    this.initialImagePath,
    this.size = 120,
    this.enableEdit = true,
    this.emptyStateText = 'Add Image',
    this.cameraIcon = Icons.camera_alt,
    this.galleryIcon = Icons.photo_library,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = 12,
    this.showBorder = true,
    this.borderColor,
    this.borderWidth = 2,
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.initialImagePath != null) {
      _selectedImage = File(widget.initialImagePath!);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
        widget.onImageSelected?.call(_selectedImage);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking image: $e'),
            backgroundColor: Styles.red,
          ),
        );
      }
    }
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Image Source',
              style: Styles.textStyle700.copyWith(
                fontSize: 18.sp,
                color: Styles.lightFontColor,
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(
                widget.cameraIcon,
                color: widget.iconColor ?? Theme.of(context).primaryColor,
                size: 28.sp,
              ),
              title: Text(
                'Camera',
                style: Styles.textStyle600.copyWith(
                  fontSize: 16.sp,
                  color: Styles.lightFontColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            Divider(height: 1.h),
            ListTile(
              leading: Icon(
                widget.galleryIcon,
                color: widget.iconColor ?? Theme.of(context).primaryColor,
                size: 28.sp,
              ),
              title: Text(
                'Gallery',
                style: Styles.textStyle600.copyWith(
                  fontSize: 16.sp,
                  color: Styles.lightFontColor,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            if (_selectedImage != null) ...[
              Divider(height: 1.h),
              ListTile(
                leading: Icon(Icons.delete, color: Styles.red, size: 28.sp),
                title: Text(
                  'Remove Image',
                  style: Styles.textStyle600.copyWith(
                    fontSize: 16.sp,
                    color: Styles.red,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedImage = null;
                  });
                  widget.onImageSelected?.call(null);
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enableEdit ? _showImageSourceDialog : null,
      child: Container(
        width: widget.size.w,
        height: widget.size.h,
        decoration: BoxDecoration(
          color:
              widget.backgroundColor ??
              Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          border: widget.showBorder
              ? Border.all(
                  color: widget.borderColor ?? Theme.of(context).primaryColor,
                  width: widget.borderWidth,
                )
              : null,
        ),
        child: _selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius.r),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(_selectedImage!, fit: BoxFit.cover),
                    if (widget.enableEdit)
                      Positioned(
                        right: 8.w,
                        top: 8.h,
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 40.sp,
                    color: widget.iconColor ?? Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.emptyStateText,
                    style: Styles.textStyle600.copyWith(
                      fontSize: 14.sp,
                      color: widget.iconColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
