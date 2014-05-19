library fractals;

import 'dart:math' as Math;
import 'package:vector_math/vector_math.dart';
import 'dart:html';

part 'fractal.dart';
part 'sierpinski.dart';
part 'pythagoras_tree.dart';

CanvasRenderingContext2D context;
SelectElement fractalSelector;

Fractal fractal;
final Vector2 startPosition = new Vector2(300.0, 300.0);
int fractalDepth = 10;
double fractalSize = 300.0;

void main() {
  // TODO: Speed controls. work in a timer with delay between each iteration
  // TODO: Work with arbitrary angles
  // TODO: Arbitrary colors, edges etc.
  // TODO: Position controls ("camera")
  
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
    fractal = new Sierpinski(context);
  }
  else if (val == 'pythagoras_tree') {
    fractal = new PythagorasTree(context);
  }
  
  updateFractal();
}

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
  
  fractal.clear();
  fractal.init(startPosition, fractalSize);
  fractal.generate(startPosition, fractalSize, fractalDepth);
}
