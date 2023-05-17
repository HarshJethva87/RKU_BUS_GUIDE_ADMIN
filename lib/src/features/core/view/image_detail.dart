import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class ImageDetailClass extends StatefulWidget {
  static const String id = "image-detail-screen";

  @override
  State<ImageDetailClass> createState() => _ImageDetailClassState();
}

class _ImageDetailClassState extends State<ImageDetailClass> {

// late File _imageFile;
// bool _isLoading = false;

// //Get Image for User Device

//  Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   //Upload Image in Firebase

//  Future<void> _uploadImage() async {
//     setState(() {
//       _isLoading = true;
//     });

    
//     final Reference storageRef = FirebaseStorage.instance.ref();

//     // Create a reference to the image file in Firebase Storage
//     final Reference imageRef = storageRef.child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

//     // Upload the image file to Firebase Storage
//     await imageRef.putFile(_imageFile);

//     // Get the download URL of the uploaded image
//     final String imageUrl = await imageRef.getDownloadURL();

//     // Get a reference to the Cloud Firestore collection
//     final CollectionReference imagesRef = FirebaseFirestore.instance.collection('images');

//     // Create a new document with the image URL
//     final doc = await imagesRef.add({'url': imageUrl});

//     // Get the ID of the document for future reference
//     final docId = doc.id;

//     setState(() {
//       _isLoading = false;
//       _imageFile = null as File;
//     });

//  ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Image uploaded successfully!'),
//       ),
//     );
//   }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Image Detail Class"),
      ),
    );
    //  Column(
    //     children:[
    //  Center(
    //     child: _imageFile == null
    //         ? Text('No image selected.')
    //         : Image.file(_imageFile),
    //   ),
    //   FloatingActionButton(
    //     onPressed: _isLoading ? null : _pickImage,
    //     tooltip: 'Pick Image',
    //     child: Icon(Icons.add_a_photo),
    //   ),
   
    //     ],
      
    // );
    
  }
  
}
