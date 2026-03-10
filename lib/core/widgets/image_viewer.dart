import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageViewer extends StatelessWidget {
  final bool isUserImage;
  final String? imagePath;
  final String? imageUrl;
  const ImageViewer({super.key , this.isUserImage = true, this.imagePath, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          isUserImage ? IconButton(
            icon: const Icon(Icons.download, color: Colors.white),
            onPressed: () => _saveImage(context),
          )
          : const SizedBox.shrink(),
        ],
      ),
      body: PhotoView(
        filterQuality: FilterQuality.high,
        imageProvider: imagePath != null
            ? FileImage(File(imagePath!))
            : imageUrl != null
            ? CachedNetworkImageProvider(
                "https://back.ibond.ai/uploads/profiles/${imageUrl ?? ''}",
              )
            : AssetImage('assets/images/default_user_image.png'),

        minScale: PhotoViewComputedScale.contained * 1.0,
        maxScale: PhotoViewComputedScale.contained * 4.0,
        initialScale: PhotoViewComputedScale.contained,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        enableRotation: false,
        tightMode: false,
        loadingBuilder: (context, event) =>
            const Center(child: CircularProgressIndicator(color: Colors.white)),
        customSize: MediaQuery.of(context).size,
      ),
    );
  }

  void _saveImage(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("جاري تحميل الصورة...")));
  }
}
