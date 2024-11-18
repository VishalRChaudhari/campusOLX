import 'dart:io';

import 'package:books/Widgets/addpage/addpageTextfield.dart';
import 'package:books/data/dummydata.dart';
import 'package:books/models/models/items.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  File? _imageFile;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _titlecontroller = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final dropdownItemmController = TextEditingController();

    final amountcontroller = int.tryParse(priceController.text);

    void onSubmit(Items item) {
      itemlist.add(item);
      Navigator.pop(context);
    }

    @override
    void dispose() {
      _titlecontroller.dispose();
      priceController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: _titlecontroller,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[50],
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //title textfield
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Description',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                AddPageTextField(
                  controller: descriptionController,
                  keyboardType: null,
                  icon: null,
                ), //title textfield
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Price',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                AddPageTextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  icon: const Icon(
                    Icons.currency_rupee_sharp,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Select the Category',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownMenu(
                    controller: dropdownItemmController,
                    dropdownMenuEntries: [
                      for (final category in availableCategories)
                        DropdownMenuEntry(
                            value: (val) {
                              dropdownItemmController == val;
                            },
                            label: category.title)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //Image Add
                // Button to pick image
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),

                // Display selected image (if any)
                if (_imageFile != null) Image.file(_imageFile!),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission (e.g., upload data)
                      print('Ad details:');
                      print('Title: ${_titlecontroller.text}');
                      print('Description: ${descriptionController.text}');
                      print('Price: ${priceController.text}');
                      
                      // Access and process the image file using _imageFile
                    }
                  },
                  child: Text('Submit Ad'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
DropdownMenuEntry(value: () {}, label: 'vehicle'),
                    DropdownMenuEntry(value: () {}, label: 'Books'),
                    DropdownMenuEntry(value: () {}, label: 'Furniture'),
                    DropdownMenuEntry(value: () {}, label: 'Electronic Gadgets'),

                    DropdownMenu(
                  controller: dropdownItemmController,
                  
                  dropdownMenuEntries: [
                    for(final category in availableCategories)
                    DropdownMenuEntry(value: (val){
                      setState(() {
                        val == dropdownItemmController;
                      });
                    }, label: category.title)
                    
                  ],
                ),

Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Select the Category',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)
              ),
              DropdownMenu(dropdownMenuEntries: [
              DropdownMenuEntry(value: () {}, label: 'vehicle'),
              DropdownMenuEntry(value: () {}, label: 'Books'),
              DropdownMenuEntry(value: () {}, label: 'Furniture'),
              DropdownMenuEntry(value: () {}, label: 'Electronic Gadgets'),
              ],
              label: const Text('category'),
              )
            ],
          ),
          
          
        ],
      ),*/
