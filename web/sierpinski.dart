part of fractals;

class Sierpinski extends Fractal {
  
  Sierpinski(CanvasRenderingContext2D context) : super(context);
  
  void init(Vector2 position, double size) {
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
  
  void generate(Vector2 position, double size, int depth) {
    if (depth <= 0) return;
    depth--;
    
    // Draw your own triangle
    _drawTriangle(position, size);

    // Generate children
    final double newSize = size / 2;
    
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
  
  void _drawTriangle(Vector2 position, double size) {
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