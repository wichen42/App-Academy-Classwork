const View = require("./ttt-view")// require appropriate file
const Game = require("../ttt_node/game.js")// require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here

  let ttt = document.getElementsByClassName("ttt");
  // let test = document.getElementById("test");

  let game = new Game();
  let view = new View(game, ttt[0] );
  
  view.setupBoard();
  view.bindEvents();
});

