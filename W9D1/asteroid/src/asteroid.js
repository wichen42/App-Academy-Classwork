const MovingObject = require('./moving_object');
const { randomVec } = require('./utils');
const Util = require('./utils');

class Asteroid {
   constructor(pos) {
      this.color = "#FFA500";
      this.radius = 6;
      this.pos = Object.values(pos);
      this.vel = [randomVec(800), randomVec(800)];

      let asteroid = new MovingObject({pos: this.pos, vel: this.vel, radius: this.radius, color: this.color});

      return asteroid;
   }
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;
window.Asteroid = Asteroid;