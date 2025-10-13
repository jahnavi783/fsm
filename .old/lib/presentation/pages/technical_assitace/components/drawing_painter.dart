import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 0.05;

    for (var point in points) {
      if (point != null) {
        canvas.drawCircle(point, 2.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DrawingCanvas extends StatefulWidget {
  final Function(Offset offset) onDraw;
  final Function() onClear;

  const DrawingCanvas({super.key, required this.onDraw, required this.onClear});

  @override
  DrawingCanvasState createState() => DrawingCanvasState();
}

class DrawingCanvasState extends State<DrawingCanvas> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          points.add(details.localPosition);
        });

        final videoWidth = MediaQuery.of(context).size.width;
        final videoHeight = MediaQuery.of(context).size.height;
        final relativeX = details.localPosition.dx / videoWidth;
        final relativeY = details.localPosition.dy / videoHeight;

        widget.onDraw(Offset(relativeX, relativeY));
      },
      onPanEnd: (details) {
        points.add(null);
      },
      child: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: DrawingPainter(points),
          ),
          Visibility(
            visible: points.isNotEmpty,
            child: Positioned(
              bottom: (5),
              left: (5),
              child: TextButton.icon(
                icon: Icon(Icons.delete_forever, color: Colors.red),
                label: Text("Clear Markings"),
                onPressed: () {
                  setState(() {
                    points.clear();
                  });
                  widget.onClear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
