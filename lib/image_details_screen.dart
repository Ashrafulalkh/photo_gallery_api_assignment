import 'package:flutter/material.dart';
import 'package:photo_gallery_api_assignment/image_model.dart';

class ImageDetailsScreen extends StatefulWidget {
   ImageDetailsScreen({super.key,required this.imageModel});

  ImageModel imageModel;

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {

  String? image;
  String? title;
  String? id;

  @override
  void initState() {
    image = widget.imageModel.thumbnail;
    title = widget.imageModel.title;
    id = widget.imageModel.id.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Photo Details'),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image ?? 'Unknown'),
                  fit: BoxFit.cover
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                Text(
                  'Title: $title ',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ID: $id',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}
