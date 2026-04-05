import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class RecipePdfDownloadScreen extends StatefulWidget {
  final String title;
  final List ingredients;
  final List steps;

  const RecipePdfDownloadScreen({
    super.key,
    required this.title,
    required this.ingredients,
    required this.steps,
  });

  @override
  State<RecipePdfDownloadScreen> createState() =>
      _RecipePdfDownloadScreenState();
}

class _RecipePdfDownloadScreenState extends State<RecipePdfDownloadScreen> {

 Future<void> generatePdf() async {

  final font = pw.Font.ttf(
    await rootBundle.load("assets/fonts/NotoSansDevanagari-Regular.ttf"),
  );

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [

            pw.Text(
              widget.title,
              style: pw.TextStyle(
                font: font,
                fontSize: 26,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "सामग्री",
              style: pw.TextStyle(
                font: font,
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            ...widget.ingredients.map(
              (e) => pw.Text(
                "• $e",
                style: pw.TextStyle(font: font, fontSize: 14),
              ),
            ),

            pw.SizedBox(height: 20),

            pw.Text(
              "बनाने की विधि",
              style: pw.TextStyle(
                font: font,
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            ...widget.steps.map(
              (e) => pw.Text(
                e,
                style: pw.TextStyle(font: font, fontSize: 14),
              ),
            ),
          ],
        );
      },
    ),
  );

  await Permission.storage.request();

  final directory = Directory("/storage/emulated/0/Download");
  final file = File("${directory.path}/${widget.title}_recipe.pdf");

  await file.writeAsBytes(await pdf.save());

  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("PDF Downloaded in Downloads Folder")),
  );

  await Future.delayed(const Duration(seconds: 1));
  Navigator.pop(context);
}

  @override
  void initState() {
    super.initState();
    generatePdf();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1B),
      appBar: AppBar(
        title: const Text("Downloading Recipe"),
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}