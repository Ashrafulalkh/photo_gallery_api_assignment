import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_gallery_api_assignment/image_details_screen.dart';
import 'package:http/http.dart';
import 'package:photo_gallery_api_assignment/image_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _getImageInProgress = false;

  List<ImageModel> imageList = [];


  @override
  void initState() {
    super.initState();
    _getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Photo Gallery App'),
      ),

      body: Visibility(
        visible: _getImageInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.separated(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return _buildImageList(imageList[index]);
              },
            separatorBuilder: (_, __) => const SizedBox(height: 10,),
            ),
        ),
      ),
    );
  }

  Widget _buildImageList(ImageModel imageModel) {
    return SingleChildScrollView(
      child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailsScreen(imageModel: imageModel,)));
                },
                child: ListTile(
                    leading: Image.network(imageModel.thumbnail ?? 'Unknown'),
      
                    title:  Text(imageModel.title ?? 'Unknown'),
                ),
      
      
              ),
    );
  }

  Future<void> _getImages() async {

    _getImageInProgress = true;

    imageList.clear();
    setState(() {});

    String getImageUrl = 'https://jsonplaceholder.typicode.com/photos';

    Uri uri = Uri.parse(getImageUrl);

    Response response = await get(uri);

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){

      final decodeData =jsonDecode(response.body);

      for(Map<String,dynamic> image in decodeData) {
        ImageModel imageModel = ImageModel.fromJson(image);

        imageList.add(imageModel);
      }

    }else {

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Get Image List Failed!! Try Again')));
    }

    _getImageInProgress = false;
    setState(() {});




  }

  @override
  void dispose() {
    super.dispose();
  }


}
