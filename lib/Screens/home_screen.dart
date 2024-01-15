import 'dart:io';
import 'dart:ui';
import 'package:docs_reader/ViewScreens/doc_view_screen.dart';
import 'package:docs_reader/ViewScreens/excel_view_screen.dart';
import 'package:docs_reader/ViewScreens/pdf_view_screen.dart';
import 'package:docs_reader/ViewScreens/ppt_view_screen.dart';
import 'package:docs_reader/Widgets/grid_view_widget.dart';
import 'package:docs_reader/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScreenshotCallback screenshotCallback = ScreenshotCallback();
  double sdCardAvailableGB = 0;
  double sdCardTotalSpace = 0;
  double internalStorageAvailableGB = 0;
  double internalStorageTotalSpace = 0;
  int pdfFileLength = 0;
  int docFileLength = 0;
  int excelFileLength = 0;
  int pptFileLength = 0;
  // String? selectedPdffile;

  // Future<void> getFilesFromDirectory()async{
  //   try {
  //     final apdir = await getApplicationDocumentsDirectory();
  //     final List<FileSystemEntity> fileList = apdir.listSync(recursive: false, followLinks: false);
  //     files = fileList.where((entity) => entity.path.endsWith('.pdf')
  //     || entity.path.endsWith('.docx')
  //      || entity.path.endsWith('.xls')
  //      || entity.path.endsWith('.ppt')).toList();

  //      setState(() {
  //         pdfFileLength = fileList.where((entity) => entity.path.endsWith('.pdf')).length;
  //         docFileLength = fileList.where((entity) => entity.path.endsWith('.docx')).length;
  //         excelFileLength = fileList.where((entity) => entity.path.endsWith('.xls')).length;
  //         pptFileLength = fileList.where((entity) => entity.path.endsWith('.ppt')).length;
  //      });
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  getDeviceStorage() async {
    final appDir = await getApplicationDocumentsDirectory();
    final statInternal = await FileStat.stat(appDir.path);
    internalStorageAvailableGB = statInternal.size / 1024 / 1024 / 1024;
    internalStorageTotalSpace = statInternal.size / 1024 / 1024 / 1024;

    final externalStorageDir = await getExternalStorageDirectory();
    if (externalStorageDir != null) {
      final statExternal = await FileStat.stat(externalStorageDir.path);
      sdCardAvailableGB = statExternal.size / 1024 / 1024 / 1024;
      sdCardTotalSpace = statExternal.size / 1024 / 1024 / 1024;
    }
    print({
      'Internal Storage :',
      internalStorageAvailableGB,
      'total ',
      internalStorageTotalSpace,
      'Sd avail :',
      sdCardAvailableGB,
      'Sd total',
      sdCardTotalSpace
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceStorage();
    FlutterFileView.init();
    screenshotCallback.addListener(
      () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                backgroundColor: Colors.blueAccent.shade200,
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.orange,
                      size: 80,
                    ),
                    Text(
                      'User took a screenshot',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(double.infinity, 20),
                          backgroundColor: Colors.purple.shade50),
                      child: const Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ],
              );
            });
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    screenshotCallback.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Reader'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: screenHeight * 0.3 - 20,
              width: screenWidth,
              child: Lottie.asset('Assests/animation.json')),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                GridViewWidget(
                    fileName: 'Pdf files',
                    image: 'Assests/pdf.png',
                    fileCount: '($pdfFileLength)',
                    onTap: () {
                      // loadPdfFiles();
                      // if(files !=null){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PdfScreenView()));
                      // }
                    }),
                GridViewWidget(
                    fileName: 'Word files',
                    image: 'Assests/doc.png',
                    fileCount: '($docFileLength)',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DocScreenView()));
                    }),
                GridViewWidget(
                    fileName: 'Excel files',
                    image: 'Assests/xls.png',
                    fileCount: '($excelFileLength)',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ExcelScreenView()));
                    }),
                GridViewWidget(
                    fileName: 'PPT files',
                    image: 'Assests/ppt.png',
                    fileCount: '($pptFileLength)',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PPTScreenView()));
                    }),
              ],
            ),
          )),
          // ShowSpaceWidget(width: screenWidth, height: 50, progress: 1)//widget.internalStorageAvailableGB / widget.internalStorageTotalSpace)
          LinearProgressIndicator(
            value: internalStorageTotalSpace != 0
                ? (internalStorageAvailableGB.abs() /
                        internalStorageTotalSpace.abs())
                    .abs()
                : 0.0,
            minHeight: 20,
            backgroundColor: Colors.amber,
          )
        ],
      )),
    );
  }
}
