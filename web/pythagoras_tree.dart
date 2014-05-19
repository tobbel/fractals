part of fractals;

class PythagorasTree {

  CanvasRenderingContext2D context;
  
  PythagorasTree(this.context);
  
  void clear() => context.clearRect(0, 0, context.canvas.width, context.canvas.height);
  
  void generateTree(Vector2 position, double size, int depth) {
    if (depth <= 0) return;
    depth--;
  
    // Fill this
    context.fillRect(position.x, position.y, size, size);
    
    // Translate to upper left corner of current rect
    context.translate(position.x, position.y);
    
    // Rotate left
    context.rotate(-Math.PI / 4);
    
    double newSize = size * (Math.SQRT1_2);
    
    // Rotated 45 degrees left, upper left of left rect is 1 side local up
    context.translate(0, -newSize);
   
    // Generate at local 0 since canvas is already offset
    generateTree(new Vector2(0.0, 0.0), newSize, depth);
    
    // Translate back
    context.translate(0, newSize);
    
    // Rotate right
    context.rotate(Math.PI / 2);
    
    // Rotated 45 degrees right, upper left of right rect is 2 sides local up
    context.translate(0, -newSize * 2.0);
    
    generateTree(new Vector2(0.0, 0.0), newSize, depth);
    
    // Translate back
    context.translate(0, newSize * 2.0);
    
    // Rotate back 
    context.rotate(-Math.PI / 4);
    
    // Translate back
    context.translate(-position.x, -position.y);
  }
}