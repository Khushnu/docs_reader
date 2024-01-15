import 'package:docs_reader/main.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  final String fileName; 
  final String image; 
  final String fileCount;
  final Function() onTap;
  const GridViewWidget({super.key, 
  required this.fileName,
   required this.image, 
   required this.fileCount, required this.onTap});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
                     height: screenHeight * 0.1 + 30,  
                     padding: const EdgeInsets.all(16),
                     decoration:  BoxDecoration(
                       color: Colors.grey.shade200, 
                       borderRadius: BorderRadius.circular(15)
                     ),
                     child: Column(
                       children: [
                         Image.asset(widget.image, 
                         height: screenHeight * 0.1 - 25, ), 
                         const SizedBox(
                           height: 15,
                         ),
                         Text(widget.fileName, style: const TextStyle(color: Colors.black, fontSize: 17),),
                         Text(widget.fileCount, style: const TextStyle(color: Colors.black, fontSize: 17),),
                       ],
                     ),
                   ),
    );
  }
}