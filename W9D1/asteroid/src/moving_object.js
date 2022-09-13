function MovingObject(options) {
   this.pos = options["pos"];
   this.vel = options["vel"];
   this.radius = options["radius"];
   this.color = options["color"];
}

MovingObject.prototype.draw = function(ctx) {
   ctx.beginPath();
   ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
   
   ctx.strokeStyle = 'white';
   ctx.lineWidth = 3;
   ctx.stroke();

   ctx.fillStyle = 'blue';
   ctx.fill();
}

MovingObject.prototype.move = function () {

    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];

}

module.exports = MovingObject;

window.MovingObject = MovingObject;

// const mo = new MovingObject({
//    pos: [30, 30],
//    vel: [10, 10],
//    radius: 10,
//    color: "#00FF00"
//  });

// let context = document.getElementById('game-canvas').getContext('2d')