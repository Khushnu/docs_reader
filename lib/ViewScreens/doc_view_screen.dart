import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:power_file_view/power_file_view.dart';


class DocScreenView extends StatefulWidget {
  const DocScreenView({super.key});

  @override
  State<DocScreenView> createState() => _DocScreenViewState();
}

class _DocScreenViewState extends State<DocScreenView> {
 String? file;
//  List<File> _docFiles = [];
String? downloadUrl;
  Future<void> docFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
      );
     
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          file = result.files.first.path!;
          // _docFiles = result.files.map((file) => File(file.path!)).toList();
          downloadUrl = file;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }
@override
  void initState() {
    // TODO: implement initState
    // FlutterFileView.init();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Word Files'),
        ),
        body: file == null
            ? Center(
                child: ElevatedButton(
                onPressed: docFiles,
                child: const Text('Open Doc Files'),
              ))
            :  PowerFileViewWidget(
              downloadUrl: downloadUrl,
              filePath: file! )
            // FileView(controller: FileViewController.file(file!))
          //  OpenFile.open('$file', type: 'docx' )
            // PDFView(
            //     filePath: file,
            //     enableSwipe: true,
            //     swipeHorizontal: true,
            //     autoSpacing: false,
            //     pageFling: false,
            //     fitEachPage: true,
            //   )
              );
  }

  Icon getIcon(String filePath) {
    if (filePath.endsWith('.pdf')) {
      return const Icon(Icons.picture_as_pdf);
    } else if (filePath.endsWith('.docx')) {
      return const Icon(Icons.description);
    } else if (filePath.endsWith('.ppt')) {
      return const Icon(Icons.slideshow);
    } else {
      return const Icon(Icons.insert_drive_file);
    }
  }
}
