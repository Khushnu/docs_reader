import 'dart:async';
// import 'package:pdf/widgets.dart' show PdfViewerController;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfScreenView extends StatefulWidget {

  const PdfScreenView({super.key,});

  @override
  State<PdfScreenView> createState() => _PdfScreenViewState();
}

class _PdfScreenViewState extends State<PdfScreenView> {


String? file;
// late Directory dir;
// List<FileSystemEntity> _files = [];


//  List<File> _pdfFiles = [];

// //  List<File> _pdfFiles = [];

  Future<void> loadPdfFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      // if (result != null && result.files.isNotEmpty) {
        setState(()  {
          file =  result?.files.first.path ;
          // _pdfFiles = result.files.map((file) => File(file.path!)).toList();
        });
      // }
    } catch (e) {
      print('Error: $e');
    }
  }

// Future<void> initDirectory() async {
//   var status = await Permission.storage.request();
//   if (status.isGranted) {
//     dir = Directory('/storage/emulated/0');
//     _files = await dirContents(dir);
//     setState(() {
//       _files;
//       print(dir.path);
//     // print('directory $_files');
//     });
//   } else {
//    print('Permission denied');
//   }
// }

// Future<List<FileSystemEntity>> dirContents(Directory dir) async {
//   // var files = <FileSystemEntity>[];
//   var completer = Completer<List<FileSystemEntity>>();
  
//   await for (var file in dir.list(recursive: false)) {
//     FileStat f = file.statSync();
//     if (f.type == FileSystemEntityType.directory) {
//       await dirContents(Directory(file.uri.toFilePath()));
//     } else if (f.type == FileSystemEntityType.file && file.path.endsWith('.pdf')) {
//       _files.add(file);
//     }
//   }

//   completer.complete(_files);
//   return completer.future;
// }



  // Future<void> getFilesFromDirectory()async{
  //   try {
  //     final apdir = await getApplicationDocumentsDirectory(); 
  //     final List<FileSystemEntity> fileList = apdir.listSync(recursive: false, followLinks: false); 
  //     files = fileList.where((entity) => entity.path.endsWith('.pdf')).toList();

      
  //      setState(() {
  //         // pdfFileLength = fileList.where((entity) => entity.path.endsWith('.pdf')).length;
  //         // docFileLength = fileList.where((entity) => entity.path.endsWith('.docx')).length;
  //         // excelFileLength = fileList.where((entity) => entity.path.endsWith('.xls')).length;
  //         // pptFileLength = fileList.where((entity) => entity.path.endsWith('.ppt')).length;
  //      });
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print(file);
    return Scaffold(appBar: AppBar(
      title: const Text('Pdf viewer'),
      centerTitle: true,
    ),
    body: file == null ? Center(
      child: ElevatedButton(
      onPressed: loadPdfFiles, 
     child: const Text('Open Pdf Files'), )) :   PDFView(filePath: file,
    enableSwipe: true,
  swipeHorizontal: true,
  autoSpacing: false,
  pageFling: false,
  fitEachPage: true,
      )
                      // SfPdfViewer.file(
                      // enableDoubleTapZooming: false,
                      // enableTextSelection: false,
                      // canShowHyperlinkDialog: false,
                      // canShowPaginationDialog: false,
                      // canShowPasswordDialog: false,
                      // canShowPageLoadingIndicator: false,
                      // canShowScrollHead: false,
                      // canShowScrollStatus: false,
                      // enableDocumentLinkAnnotation: false,
                      // enableHyperlinkNavigation: false,
                      // File(file!))
    );
 
  //   );
    
    
    
    // ) : SfPdfViewer.file(
    //                   enableDoubleTapZooming: false,
    //                   enableTextSelection: false,
    //                   canShowHyperlinkDialog: false,
    //                   canShowPaginationDialog: false,
    //                   canShowPasswordDialog: false,
    //                   canShowPageLoadingIndicator: false,
    //                   canShowScrollHead: false,
    //                   canShowScrollStatus: false,
    //                   enableDocumentLinkAnnotation: false,
    //                   enableHyperlinkNavigation: false,
    //                   File(file!)),
                
   
  }

  // Icon getIcon(String filePath) {
  //   if (filePath.endsWith('.pdf')) {
  //     return const Icon(Icons.picture_as_pdf);
  //   } else if (filePath.endsWith('.docx')) {
  //     return const Icon(Icons.description);
  //   } else if (filePath.endsWith('.ppt')) {
  //     return const Icon(Icons.slideshow);
  //   } else {
  //     return const Icon(Icons.insert_drive_file);
  //   }
  // }
}