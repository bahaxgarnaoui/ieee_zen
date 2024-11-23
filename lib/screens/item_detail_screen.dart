import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picking
import 'dart:io'; // Import for File
import './avatar_screen.dart'; // Import your AvatarScreen
import '../models/item_model.dart';

class ItemDetailScreen extends StatelessWidget {
  final ItemModel item;

  const ItemDetailScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  Future<void> _takePhoto(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      // Handle the photo (e.g., navigate to another screen with the photo)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoPreviewScreen(imagePath: photo.path),
        ),
      );
    }
  }

  Future<void> _pickFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the selected image (e.g., navigate to another screen with the image)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoPreviewScreen(imagePath: image.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.imageUrl,
              child: Image.network(
                item.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20), // Add some space before buttons

                  // Row for buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _takePhoto(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.camera_alt),
                            SizedBox(width: 8),
                            Text('Try it on'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _pickFromGallery(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.photo_library),
                            SizedBox(width: 8),
                            Text('Gallery'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvatarScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.face),
                            SizedBox(width: 8),
                            Text('Avatar'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for PhotoPreviewScreen
class PhotoPreviewScreen extends StatelessWidget {
  final String imagePath;

  const PhotoPreviewScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Preview')),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}
