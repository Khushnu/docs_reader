import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_view/flutter_file_view.dart';
// import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class ExcelScreenView extends StatefulWidget {
  const ExcelScreenView({super.key});

  @override
  State<ExcelScreenView> createState() => _ExcelScreenViewState();
}

class _ExcelScreenViewState extends State<ExcelScreenView> {
  File? file;


Future<void> docFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['doc', 'docx'],
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          file = File(result.files.first.path!);
          // _docFiles = result.files.map((file) => File(file.path!)).toList();
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  // Future<void> readExcelFile() async {
  //   try {
  //     // Replace 'your_excel_file.xlsx' with the actual path to your Excel file
  //     final String filePath = 'your_excel_file.xlsx';

  //     // Load the Excel file
  //     final Workbook workbook = Workbook();
  //     // await workbook.
  //     (File(filePath).readAsBytesSync());
  //     // Read data from the first worksheet
  //     final Worksheet sheet = workbook.worksheets[0];
  //     for (int row = 1; row <= sheet.rows.count; row++) {
  //       for (int col = 1; col <= sheet.columns.count; col++) {
  //         final String cellValue =
  //             sheet.getRangeByIndex(row, col).text ?? '';
  //         excelData.add(cellValue);
  //       }
  //     }
  //     // Close the workbook
  //     workbook.dispose();
  //     setState(() {});
  //   } catch (e) {
  //     print('Error reading Excel file: $e');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    FlutterFileView.init();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excel View"), 
        centerTitle: true, 
      ),
      body: file == null ?  Center(
        child: ElevatedButton(onPressed: (){}, child: const Text('Open Excel Files')),
      ) : FileView(controller: FileViewController.file(file!))
    );
  }
}