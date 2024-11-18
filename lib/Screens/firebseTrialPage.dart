import 'dart:io';
import 'package:books/Screens/homepage.dart';
import 'package:books/data/dummydata.dart';
import 'package:books/services/firestoreServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateAdPagee extends StatefulWidget {
  const CreateAdPagee({Key? key}) : super(key: key);

  @override
  _CreateAdPageeState createState() => _CreateAdPageeState();
}

class _CreateAdPageeState extends State<CreateAdPagee> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _selectedCategory = 'Select Category'; // Default dropdown value
  File? _imageFile; // To store the selected image
  bool _uploadingImage = false; // To track if image upload is in progress

  // Image picker functionality
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _uploadingImage = true; // Set to true to indicate image upload is in progress
      });
      // Upload the image to Firebase Storage
      await _uploadImageToFirebaseStorage(_imageFile!);
      setState(() {
        _uploadingImage = false; // Set back to false after upload is complete
      });
    }
  }

  // Upload image to Firebase Storage
  Future<void> _uploadImageToFirebaseStorage(File imageFile) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageRef = storage.ref().child("images/${DateTime.now().millisecondsSinceEpoch}");
      await storageRef.putFile(imageFile);
      String imageUrl = await storageRef.getDownloadURL();
      // Handle the uploaded image URL as needed (e.g., save it to Firestore)
      print('Image uploaded to Firebase Storage. URL: $imageUrl');
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Ad'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Ad Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Dropdown for category selection
              // Implement your DropdownMenu widget or use Flutter's built-in DropdownButtonFormField
              // Replace the following DropdownMenu widget with your actual implementation
              DropdownMenu(
                onSelected: (String? newvalue) {
                  setState(() {
                    _selectedCategory = newvalue!;
                  });
                },
                dropdownMenuEntries: [
                  for (final category in availableCategories)
                    DropdownMenuEntry(
                        value: category.title, label: category.title)
                ],
              ),

              SizedBox(height: 20),
              // Button to pick image
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Select Image'),
              ),
              SizedBox(height: 10),
              // Display selected image (if any)
              if (_uploadingImage)
                CircularProgressIndicator() // Show loading indicator while uploading image
              else if (_imageFile != null)
                Image.file(_imageFile!),
              SizedBox(height: 40),
              // Submit button with form validation
              Center(
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CupertinoButton(
                    color: Colors.black,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission (e.g., upload data)
                        /*print('Ad details:');
                        print('Title: ${_titleController.text}');
                        print('Description: ${_descriptionController.text}');
                        print('Price: ${_priceController.text}');
                        print('Category: $_selectedCategory');
                        // Access and process the image file using _imageFile*/
                        createAD(
                          _titleController.text,
                          _descriptionController.text,
                          _selectedCategory,
                          _priceController.text,
                       
                        );
                      }
                      ;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ));
                    },
                    child: const Text('Submit Ad'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
