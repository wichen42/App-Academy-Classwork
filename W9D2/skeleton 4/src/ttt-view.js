class View {
  constructor(game, el) {
    this.game = game;
    this.el = el; // figure (hold the grid and ttt logic)
    // console.log(game);

  }

  setupBoard() {

    for (let i = 0; i < 3; i++) {
      let ul = document.createElement("ul");
      ul.id = "row";
      this.el.appendChild(ul);
      for (let j = 0; j < 3; j++) {
        let li = document.createElement("li");
        ul.appendChild(li);
        li.innerHTML = " - "
        li.dataset.index = `[${j}, ${i}]`
      }
    }

  }

  
  bindEvents() {
    const board = document.querySelector('.ttt')
    board.addEventListener("click", this.handleClick.bind(this) );
  }

  handleClick(e) {
    // console.log(e.target.dataset.index)
    let str_pos = e.target.dataset.index;
    let pos = [parseInt(str_pos[1]), parseInt(str_pos[4])]
    // console.log(this.game);
    if (!e.target.dataset.mark && !this.game.isOver()) {
      this.game.playMove(pos);
      e.target.dataset.mark = this.game.currentPlayer;
      this.makeMove(e.target);
    }
    
    
  }
  
  makeMove(square) {
    square.innerHTML = square.dataset.mark;
    square.id = "whitebg";
    
    if (this.game.isOver()) {
      let collection = this.el.children

      let arr = [];
      for (let i = 0; i < collection.length; i++) {
        arr.push(collection[i])
      }

      arr.forEach(el => {

        for (let i = 0; i < 3; i++) {
          if (el.children[i].dataset.mark === square.dataset.mark) {el.children[i].id = 'winner'}
          else {el.children[i].id = 'loser'}
        }
      })

    }
  }

}

module.exports = View;
