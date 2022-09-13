console.log("Hello World");

const MovingObject = require('./moving_object');
const Asteroid = require('./asteroid');

document.addEventListener('DOMContentLoaded', function() {
   const canvasEl = document.getElementById('game-canvas');

   canvasEl.width = 800;
   canvasEl.height = 800;

   const context = canvasEl.getContext('2d');

   context.fillStyle = 'black';
   context.fillRect(0,0,800,800);

   const mo = new MovingObject();

   setTimeout(function () {
    mo.draw(context);
    mo.move()
   })

   const asteroid = new Asteroid();

})




// document.addEventListener("DOMContentLoaded", function () {
//     const canvasEl = document.getElementById('game-canvas');
//     const ctx = canvasEl.getContext("2d");
    
// }) 

