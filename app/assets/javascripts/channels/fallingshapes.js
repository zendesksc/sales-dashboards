// Enums

const PARENT = 'background'

const shapes = {
  RECTANGLE: 0,
  CIRCLE: 1,
  TRIANGLE: 2,
  TRIANGLE_ALT: 3
}

const colors = {
  GREEN: '#78A300',
  TURQUOISE: '#37B8AF',
  PINK: '#EB4962',
  RED: '#EB6651',
  ORANGE: '#F79A3E',
  YELLOW: '#EFC93D'
}

// Helpers

function randomValueFromObj(obj) {
  let result
  let count = 0
  for (var prop in obj) {
    if (Math.random() < 1 / ++count) {
      result = obj[prop]
    }
  }
  return result
}

// Classes

function Canvas() {

  let width = window.innerWidth
  let height = window.innerHeight

  let shapeCount = 100
  let inActiveShapes = []

  this.isRunning = false

  this.start = () => {
    let canvas = document.createElement('canvas')
    canvas.id = 'canvas'
    canvas.width = width
    canvas.height = height
    this.context = canvas.getContext('2d')
    let parent = document.getElementById(PARENT)
    parent.appendChild(canvas)

    this.load()
  }

  this.load = () => {
    this.shapes = []
    for (let i = 0; i < shapeCount; i++) {
      let size = Math.random() * (40 - 10) + 10
      this.shapes.push(
        new Shape(
          randomValueFromObj(shapes),
          Math.floor(Math.random() * width) + 1,
          Math.random() * (-100 - -600) + -600,
          size, size,
          randomValueFromObj(colors))
      )
    }

    this.isRunning = true

    this.loop()
  }

  this.loop = () => {
    if (this.isRunning) {
      this.update()
      this.render()
      setTimeout(() => requestAnimationFrame(this.loop), 10)
    }
  }

  this.update = () => {

    if (inActiveShapes.length === this.shapes.length) {
      this.isRunning = false
    }

    this.shapes.forEach((shape) => {

      if (shape.y > height) {
        shape.y = Math.random() * (-100 - -600) + -600
        shape.isActive = false

        if (inActiveShapes.indexOf(shape) === -1) {
          inActiveShapes.push(shape)
        }

      }

      if (shape !== null) {
        shape.update()
      }
    })
  }

  this.render = () => {
    this.context.clearRect(0, 0, width, height)

    this.shapes.forEach((shape) => {
      if (shape !== null) {
        shape.render(this.context)
      }
    })
  }
}

function Shape(type, x, y, w, h, color) {

  this.type = type
  this.x = x
  this.y = y
  this.w = w
  this.h = h
  this.color = color
  this.radius = this.w / 2

  this.vy = Math.random() * (10 - 3) + 3
  this.isActive = true

  this.update = () => {
    if (this.isActive) {
      this.y += this.vy
    }
  }

  this.render = (context) => {
    if (this.isActive) {
      switch (this.type) {
        case shapes.RECTANGLE:
          context.fillStyle = this.color
          context.fillRect(this.x, this.y, this.w, this.h)
          break
        case shapes.CIRCLE:
          context.beginPath()
          context.arc(this.x, this.y, this.radius, 0, 2 * Math.PI, false)
          context.fillStyle = this.color
          context.fill()
          break
        case shapes.TRIANGLE:
          context.beginPath()
          context.moveTo(this.x, this.y)
          context.lineTo(this.x + this.w, this.y)
          context.lineTo(this.x, this.y + this.h)
          context.fillStyle = this.color
          context.fill()
          break
        case shapes.TRIANGLE_ALT:
          context.beginPath()
          context.moveTo(this.x, this.y)
          context.lineTo(this.x - this.w / 1.2, this.y + this.h)
          context.lineTo(this.x + this.w / 1.2, this.y + this.h)
          context.fillStyle = this.color
          context.fill()
          break
      }
    }
  }

}

// Main

function fallingShapes() {
  let background = document.getElementById(PARENT)
  let oldCanvas = document.getElementById('canvas')
  if (oldCanvas !== null) {
    background.removeChild(oldCanvas)
  }
  let canvas = new Canvas()
  canvas.start()
}