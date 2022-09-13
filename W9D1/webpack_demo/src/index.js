console.log("in index.js");

const Game = require('./game');

const game = new Game();
console.log(game);

window.Game = Game;