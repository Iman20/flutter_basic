import 'package:flutter/material.dart';

class DrawingPage extends StatefulWidget{
  final String title;
  DrawingPage({this.title});

  DrawingState createState() => DrawingState();

}

class DrawingState extends State<DrawingPage>{
  List<Offset> _points = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details){
        setState(() {
         RenderBox referenceBox = context.findRenderObject();
         Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
         _points = List.from(_points)..add(localPosition); 
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(painter: SignaturePainter(_points), size: Size.infinite,),
    );
  }

}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);
  final List<Offset> points;
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  bool shouldRepaint(SignaturePainter other) => other.points != points;
}