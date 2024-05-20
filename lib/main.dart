import 'package:flutter/material.dart';
import 'package:photo_gallery_api_assignment/home_screen.dart';

void main() {
  runApp(const PhotoGallery());
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
