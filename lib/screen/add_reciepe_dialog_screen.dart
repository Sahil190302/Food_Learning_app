import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class AddRecipeDialogScreen extends StatefulWidget {
  final List<String> categories;

  const AddRecipeDialogScreen({super.key, required this.categories});

  @override
  State<AddRecipeDialogScreen> createState() => _AddRecipeDialogScreenState();
}

class _AddRecipeDialogScreenState extends State<AddRecipeDialogScreen> {

  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  String? selectedCategory;

  File? imageFile;
  File? videoFile;
  File? documentFile;

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => imageFile = File(file.path));
  }

  Future<void> pickVideo() async {
    final file = await picker.pickVideo(source: ImageSource.gallery);
    if (file != null) setState(() => videoFile = File(file.path));
  }

 Future<void> pickDocument() async {

  final result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'docx'],
  );

  if (result != null && result.files.single.path != null) {
    setState(() {
      documentFile = File(result.files.single.path!);
    });
  }
}

  void saveRecipe() {
    final data = {
      "category": selectedCategory,
      "title": _titleController.text,
      "description": _descController.text,
      "image": imageFile,
      "video": videoFile,
      "document": documentFile
    };

    Navigator.pop(context, data);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1B),
      appBar: AppBar(
        title: const Text("Add Recipe"),
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Category",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField(
              dropdownColor: const Color(0xFF1A1A2E),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1A1A2E),
                border: OutlineInputBorder(),
              ),
              items: widget.categories
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text(c),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => selectedCategory = v),
            ),

            const SizedBox(height: 20),

            const Text("Recipe Title",
                style: TextStyle(color: Colors.white)),

            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1A1A2E),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Description",
                style: TextStyle(color: Colors.white)),

            TextField(
              controller: _descController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFF1A1A2E),
              ),
            ),

            const SizedBox(height: 25),

            _uploadTile(
              "Upload Recipe Image",
              Icons.image,
              pickImage,
            ),

            _uploadTile(
              "Upload Video (Gallery)",
              Icons.video_collection,
              pickVideo,
            ),

            _uploadTile(
              "Upload PDF / Word",
              Icons.picture_as_pdf,
              pickDocument,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save Recipe"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: saveRecipe,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _uploadTile(String title, IconData icon, VoidCallback onTap) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),

      child: ListTile(
        onTap: onTap,
        tileColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        leading: Icon(icon, color: Colors.orange),

        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),

        trailing: const Icon(Icons.upload, color: Colors.white54),
      ),
    );
  }
}