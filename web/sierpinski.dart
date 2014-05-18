import 'dart:html';
import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';

class Sierpinski {
  CanvasRenderingContext2D context;
  static const int MAX_LEVEL = 5;
  
  Sierpinski(this.context);
  
  void init(Vector2 position, int size) {
    // Draw initial triangle
    double angle = toRadians(-60.0);
    Vector2 startPosition = new Vector2(position.x + size * Math.cos(angle), position.y + size * Math.sin(angle));
    
    angle = toRadians(60.0);
    context.beginPath();
    context.moveTo(startPosition.x, startPosition.y);
    startPosition = new Vector2(startPosition.x + (size * 2) * Math.cos(angle), startPosition.y + (size * 2) * Math.sin(angle));
    context.lineTo(startPosition.x, startPosition.y);
    
    angle = toRadians(180.0);
    context.lineTo(startPosition.x + (size * 2) * Math.cos(angle), startPosition.y + (size * 2) * Math.sin(angle));
    context.fillStyle = '#000000';
    context.fill();
  }
  
  void generate(Vector2 position, int size, int depth) {
    if (depth <= 0) return;
    depth--;
    
    // Draw your own triangle
    _drawTriangle(position, size);

    // Generate children
    final int newSize = size ~/ 2;
    
    // Above
    double angle = toRadians(-60.0);
    Vector2 newPosition = new Vector2(position.x + newSize * Math.cos(angle), position.y + newSize * Math.sin(angle));
    generate(newPosition, newSize, depth);
    
    // Left
    angle = toRadians(120.0);
    newPosition = new Vector2(position.x + newSize * Math.cos(angle), position.y + newSize * Math.sin(angle));
    generate(newPosition, newSize, depth);
    
    // Right
    newPosition = new Vector2((position.x + size) + newSize * Math.cos(angle), position.y + newSize * Math.sin(angle));
    generate(newPosition, newSize, depth);
  }
  
  void clear() => context.clearRect(0, 0, context.canvas.width, context.canvas.height);
  
  void _drawTriangle(Vector2 position, int size) {
    context.beginPath();
    context.moveTo(position.x, position.y);
    context.lineTo(position.x + size, position.y);
    
    final double angle = toRadians(60.0);
    context.lineTo(position.x + size * Math.cos(angle), position.y + size * Math.sin(angle));
    context.lineTo(position.x, position.y);
    context.fillStyle = '#FFFFFF';
    context.fill();
  }
  
  double toRadians(double angle) => angle * Math.PI / 180;
}