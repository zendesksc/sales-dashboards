'use strict';

// Enums

var PARENT = 'background';

var shapes = {
  RECTANGLE: 0,
  CIRCLE: 1,
  TRIANGLE: 2,
  TRIANGLE_ALT: 3
};

var colors = {
  GREEN: '#78A300',
  TURQUOISE: '#37B8AF',
  PINK: '#EB4962',
  RED: '#EB6651',
  ORANGE: '#F79A3E',
  YELLOW: '#EFC93D'

  // Helpers

}; function randomValueFromObj(obj) {
  var result = void 0;
  var count = 0;
  for (var prop in obj) {
    if (Math.random() < 1 / ++count) {
      result = obj[prop];
    }
  }
  return result;
}

// Classes

function Canvas() {
  var _this = this;

  var width = window.innerWidth;
  var height = window.innerHeight;

  var shapeCount = 100;
  var inActiveShapes = [];

  this.isRunning = false;

  this.start = function () {
    var canvas = document.createElement('canvas');
    canvas.id = 'canvas';
    canvas.width = width;
    canvas.height = height;
    _this.context = canvas.getContext('2d');
    var parent = document.getElementById(PARENT);
    parent.appendChild(canvas);

    _this.load();
  };

  this.load = function () {
    _this.shapes = [];
    for (var i = 0; i < shapeCount; i++) {
      var size = Math.random() * (40 - 10) + 10;
      _this.shapes.push(new Shape(randomValueFromObj(shapes), Math.floor(Math.random() * width) + 1, Math.random() * (-100 - -600) + -600, size, size, randomValueFromObj(colors)));
    }

    _this.isRunning = true;

    _this.loop();
  };

  this.loop = function () {
    if (_this.isRunning) {
      _this.update();
      _this.render();
      setTimeout(function () {
        return requestAnimationFrame(_this.loop);
      }, 10);
    }
  };

  this.update = function () {

    if (inActiveShapes.length === _this.shapes.length) {
      _this.isRunning = false;
    }

    _this.shapes.forEach(function (shape) {

      if (shape.y > height) {
        shape.y = Math.random() * (-100 - -600) + -600;
        shape.isActive = false;

        if (inActiveShapes.indexOf(shape) === -1) {
          inActiveShapes.push(shape);
        }
      }

      if (shape !== null) {
        shape.update();
      }
    });
  };

  this.render = function () {
    _this.context.clearRect(0, 0, width, height);

    _this.shapes.forEach(function (shape) {
      if (shape !== null) {
        shape.render(_this.context);
      }
    });
  };
}

function Shape(type, x, y, w, h, color) {
  var _this2 = this;

  this.type = type;
  this.x = x;
  this.y = y;
  this.w = w;
  this.h = h;
  this.color = color;
  this.radius = this.w / 2;

  this.vy = Math.random() * (10 - 3) + 3;
  this.isActive = true;

  this.update = function () {
    if (_this2.isActive) {
      _this2.y += _this2.vy;
    }
  };

  this.render = function (context) {
    if (_this2.isActive) {
      switch (_this2.type) {
        case shapes.RECTANGLE:
          context.fillStyle = _this2.color;
          context.fillRect(_this2.x, _this2.y, _this2.w, _this2.h);
          break;
        case shapes.CIRCLE:
          context.beginPath();
          context.arc(_this2.x, _this2.y, _this2.radius, 0, 2 * Math.PI, false);
          context.fillStyle = _this2.color;
          context.fill();
          break;
        case shapes.TRIANGLE:
          context.beginPath();
          context.moveTo(_this2.x, _this2.y);
          context.lineTo(_this2.x + _this2.w, _this2.y);
          context.lineTo(_this2.x, _this2.y + _this2.h);
          context.fillStyle = _this2.color;
          context.fill();
          break;
        case shapes.TRIANGLE_ALT:
          context.beginPath();
          context.moveTo(_this2.x, _this2.y);
          context.lineTo(_this2.x - _this2.w / 1.2, _this2.y + _this2.h);
          context.lineTo(_this2.x + _this2.w / 1.2, _this2.y + _this2.h);
          context.fillStyle = _this2.color;
          context.fill();
          break;
      }
    }
  };
}

// Main

function fallingShapes() {
  var background = document.getElementById(PARENT);
  var oldCanvas = document.getElementById('canvas');
  if (oldCanvas !== null) {
    background.removeChild(oldCanvas);
  }
  var canvas = new Canvas();
  canvas.start();
}