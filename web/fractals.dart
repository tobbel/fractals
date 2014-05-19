library fractals;

import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';
import 'dart:html';

part 'sierpinski.dart';
part 'pythagoras_tree.dart';

CanvasRenderingContext2D context;
SelectElement fractalSelector;

Sierpinski sierp = new Sierpinski(context);
PythagorasTree pythagoras = new PythagorasTree(context);
final Vector2 startPosition = new Vector2(300.0, 300.0);

void main() {
  // TODO: Controls for depth, e.g.
  // TODO: Speed controls. work in a timer with delay between each iteration
  // TODO: Work with arbitrary angles
  // TODO: Work out why position.x and position.y must be the same value
  // TODO: Arbitrary colors, edges etc.
  CanvasElement canvas = querySelector('#canvas');
  context = canvas.context2D;
  fractalSelector = querySelector('#fractalSelector');
  fractalSelector.onChange.listen(fractalSelectorChanged);
  querySelector('#inputDepth').onInput.listen(fractalSettingChanged);
  querySelector('#inputSize').onInput.listen(fractalSettingChanged);
  
  setFractal();
}

void fractalSelectorChanged(Event e) {
  setFractal();
}

void setFractal() {
  var val = fractalSelector.value;
  if (val == 'sierpinski_triangle') {
    // Setup controls
    
    
  }
  else if (val == 'pythagoras_tree') {
    // Setup controls
  }
  updateFractal();
}
int fractalDepth = 10;
double fractalSize = 300.0;
void fractalSettingChanged(Event e) {
  updateFractal();
}

void updateFractal() {
  // Get values from UI and update current fractal
  String depthString = (querySelector('#inputDepth') as InputElement).value;
  String sizeString = (querySelector('#inputSize') as InputElement).value;
  
  if (depthString.length > 0) {
    var depth = int.parse(depthString);
    if (depth is int && depth > 0) {
      fractalDepth = depth;
    }
  }
  
  if (sizeString.length > 0) {
    var size = double.parse(sizeString);
    if (size is double && size > 0) {
      fractalSize = size;
    }
  }
  
  // TODO: Based on selected fractal
  //pythagoras.clear();
  //pythagoras.generateTree(startPosition, fractalSize, fractalDepth);
  sierp.clear();
  
  sierp.init(startPosition, fractalSize);
  sierp.generate(startPosition, fractalSize, fractalDepth);
}

void generateSierpFromInput(Event e) {
  Vector2 startPosition = new Vector2(250.0, 250.0);
  final int size = 200;
  String depthString = (e.target as InputElement).value;
  if (depthString.length <= 0) return;
  var depth = int.parse(depthString);
  if(depth is int && depth > 0) {
    sierp.clear();
    sierp.init(startPosition, size);
    sierp.generate(startPosition, size, depth);    
  }
}