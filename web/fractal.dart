part of fractals;

class Fractal {
  CanvasRenderingContext2D context;
  Fractal(this.context);
  
  void clear() => context.clearRect(0, 0, context.canvas.width, context.canvas.height);
  
  void init(Vector2 position, double size);
  void generate(Vector2 position, double size, int depth);
}
