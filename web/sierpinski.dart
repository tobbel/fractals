import 'dart:html';
import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';

class Sierpinski {
  CanvasRenderingContext2D context;
  
  Sierpinski(this.context);
  
  void draw() {
    drawTriangle(new Vector2(0.0, 0.0), 0);
  }
  
  void drawTriangle(Vector2 position, int size) {
    var numberOfSides = 3,
        size = 20,
        Xcenter = 25,
        Ycenter = 25;

    context.beginPath();
    context.moveTo (Xcenter +  size * Math.cos(0), Ycenter +  size *  Math.sin(0));          

    for (var i = 1; i <= numberOfSides;i += 1) {
      context.lineTo (Xcenter + size * Math.cos(i * 2 * Math.PI / numberOfSides), Ycenter + size * Math.sin(i * 2 * Math.PI / numberOfSides));
    }

    context.strokeStyle = "#000000";
    context.lineWidth = 1;
    context.stroke();
  }
}