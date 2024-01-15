import 'package:flutter/material.dart';

class ShowSpaceWidget extends StatefulWidget {
  final double width;  
  final double height; 
  final double progress;
  const ShowSpaceWidget({super.key, 
  required this.width, 
  required this.height, 
  required this.progress});

  @override
  State<ShowSpaceWidget> createState() => _ShowSpaceWidgetState();
}

class _ShowSpaceWidgetState extends State<ShowSpaceWidget> {
  double percent = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height, 
      width: widget.width, 
      decoration: BoxDecoration(
        color: Colors.amber.shade400, 
        borderRadius: BorderRadius.circular(13)
      ), 
      child: Stack(
        children: [
          Container(
            height: widget.width * widget.progress,
            width: widget.height * widget.progress, 
            decoration: BoxDecoration(
              color: Colors.blue, 
              borderRadius: BorderRadius.circular(13)
            ),
             child: Text('Used Space ${widget.progress * 100}') ,
          )
        ],
      ),
    );
  }
}