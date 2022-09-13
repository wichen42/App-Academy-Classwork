console.log("in game.js");

const Asteroid = require('./asteroid');

function Game() {
    this.asteroid = new Asteroid(5);
}

module.exports = Game;