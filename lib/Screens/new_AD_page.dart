import 'dart:io';
import 'package:books/Screens/homepage.dart';
import 'package:books/data/dummydata.dart';
import 'package:books/services/firestoreServices.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add image_picker dependency

class CreateAdPage extends StatefulWidget {
  const CreateAdPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateAdPageState createState() => _CreateAdPageState();
}

class _CreateAdPageState extends State<CreateAdPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _selectedCategory = 'Select Category'; // Default dropdown value
  File? _imageFile; // To store the selected image
  String imageUrl = '';

  // Image picker functionality
  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadImageToFirebaseStorage(File imageFile) async {
    String unique_name = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference refereneDirImages = referenceRoot.child('images');
    Reference referenceImagetoUpload = refereneDirImages.child(unique_name);
    try {
      await referenceImagetoUpload.putFile(File(imageFile.path));

      imageUrl = await referenceImagetoUpload.getDownloadURL();
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Allow scrolling for long content
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Ad Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              // Description field
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: null, // Allow multiline input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              // Price field with number keyboard
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
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
              const SizedBox(
                height: 10,
              ),
              // Dropdown for category selection
              DropdownMenu(
                label: Text('Select Category'),
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

              const SizedBox(
                height: 20,
              ),
              // Button to pick image
              CupertinoButton(
                color: Colors.black54,
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              const SizedBox(
                height: 10,
              ),
              // Display selected image (if any)
              if (_imageFile != null) Image.file(_imageFile!),
              const SizedBox(
                height: 40,
              ),
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

/*
 DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: [
                  DropdownMenuItem<String>(
                    value: 'Electronics',
                    child: Text('Electronics'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Furniture',
                    child: Text('Furniture'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Vehicle',
                    child: Text('Vehicle'),
                  ),
                  // Add more categories as needed
                ],
                onChanged: (value) =>
                    setState(() => _selectedCategory = value!),
                validator: (value) {
                  if (value == 'Select Category') {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
*/
