import 'dart:html';
import 'dart:math' as Math;

import 'package:vector_math/vector_math.dart';

CanvasRenderingContext2D context;
const int MAX_DEPTH = 11;

void main() {
  // TODO: Controls for depth, e.g.
  // TODO: Work with arbitrary angles
  // TODO: Work out why position.x and position.y must be the same value
  // TODO: Arbitrary colors, edges etc.
  CanvasElement canvas = querySelector('#canvas');
  context = canvas.context2D;
  
  Vector2 position = new Vector2(500.0, 500.0);
  generateTree(position, 100.0, 0);
}

void generateTree(Vector2 position, double size, int depth) {
  // Base case, use level instead?
  if (depth > MAX_DEPTH) return;

  // Fill this
  context.fillRect(position.x, position.x, size, size);
  
  // Translate to upper left corner of current rect
  context.translate(position.x, position.y);
  
  // Rotate left
  context.rotate(-Math.PI / 4);
  
  double newSize = size * (Math.SQRT1_2);
  
  // Rotated 45 degrees left, upper left of left rect is 1 side local up
  context.translate(0, -newSize);
  
  // Generate at local 0 since canvas is already offset
  generateTree(new Vector2(0.0, 0.0), newSize, depth + 1);
  
  // Translate back
  context.translate(0, newSize);
  
  // Rotate right
  context.rotate(Math.PI / 2);
  
  // Rotated 45 degrees right, upper left of right rect is 2 sides local up
  context.translate(0, -newSize * 2.0);
  
  generateTree(new Vector2(0.0, 0.0), newSize, depth + 1);
  
  // Translate back
  context.translate(0, newSize * 2.0);
  
  // Rotate back 
  context.rotate(-Math.PI / 4);
  
  // Translate back
  context.translate(-position.x, -position.y);
}