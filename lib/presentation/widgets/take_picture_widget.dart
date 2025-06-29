import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_recru_design/core/assets.dart';

class TakePictureWidget extends StatefulWidget {
  const TakePictureWidget({super.key, this.raduis = 150});
  final double raduis;

  @override
  State<TakePictureWidget> createState() => _TakePictureWidgetState();
}

class _TakePictureWidgetState extends State<TakePictureWidget> {
  XFile? _image;
  Future<void> _takeImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _takeImage,
      child: CustomPaint(
        painter: DashedCirclePainter(
          color: Color(0xFFBDBDBD),
          strokeWidth: 1.5,
          dashLength: 5,
          gapLength: 3,
          // borderRadius: 10,
        ),
        child: Container(
          width: widget.raduis,
          height: widget.raduis,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF4F4F4),
          ),
          child: _image != null
              ? Image.file(File(_image!.path), fit: BoxFit.fill)
              : Center(
                  child: SvgPicture.asset(
                    SvgIconConstants.camera,
                    height: 50,
                    width: 50,
                  ),
                ),
        ),
      ),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  DashedCirclePainter({
    required this.color,
    this.strokeWidth = 1.5,
    this.dashLength = 5,
    this.gapLength = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final circumference = 2 * 3.141592653589793 * radius;
    final dashCount = (circumference / (dashLength + gapLength)).floor();
    final angle = 2 * 3.141592653589793 / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = i * angle;
      final x1 = radius + radius * cos(startAngle);
      final y1 = radius + radius * sin(startAngle);
      final x2 =
          radius +
          radius *
              cos(startAngle + angle * dashLength / (dashLength + gapLength));
      final y2 =
          radius +
          radius *
              sin(startAngle + angle * dashLength / (dashLength + gapLength));
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
