console.log("in asteroid.js");

const MovingObject = require('./moving_object')

function Asteroid(size) {
    this.size = size;
}

module.exports = Asteroid;

window.Asteroid = Asteroid;