/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst { randomVec } = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nclass Asteroid {\n   constructor(pos) {\n      this.color = \"#FFA500\";\n      this.radius = 6;\n      this.pos = Object.values(pos);\n      this.vel = [randomVec(800), randomVec(800)];\n\n      let asteroid = new MovingObject({pos: this.pos, vel: this.vel, radius: this.radius, color: this.color});\n\n      return asteroid;\n   }\n}\n\nUtil.inherits(Asteroid, MovingObject);\nmodule.exports = Asteroid;\nwindow.Asteroid = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Hello World\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\ndocument.addEventListener('DOMContentLoaded', function() {\n   const canvasEl = document.getElementById('game-canvas');\n\n   canvasEl.width = 800;\n   canvasEl.height = 800;\n\n   const context = canvasEl.getContext('2d');\n\n   context.fillStyle = 'black';\n   context.fillRect(0,0,800,800);\n\n   const mo = new MovingObject();\n\n   setTimeout(function () {\n    mo.draw(context);\n    mo.move()\n   })\n\n   const asteroid = new Asteroid();\n\n})\n\n\n\n\n// document.addEventListener(\"DOMContentLoaded\", function () {\n//     const canvasEl = document.getElementById('game-canvas');\n//     const ctx = canvasEl.getContext(\"2d\");\n    \n// }) \n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\n   this.pos = options[\"pos\"];\n   this.vel = options[\"vel\"];\n   this.radius = options[\"radius\"];\n   this.color = options[\"color\"];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n   ctx.beginPath();\n   ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);\n   \n   ctx.strokeStyle = 'white';\n   ctx.lineWidth = 3;\n   ctx.stroke();\n\n   ctx.fillStyle = 'blue';\n   ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n\n}\n\nmodule.exports = MovingObject;\n\nwindow.MovingObject = MovingObject;\n\n// const mo = new MovingObject({\n//    pos: [30, 30],\n//    vel: [10, 10],\n//    radius: 10,\n//    color: \"#00FF00\"\n//  });\n\n// let context = document.getElementById('game-canvas').getContext('2d')\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("const Util = {\n   inherits(childClass, parentClass) {\n      function Surrogate() {};\n      Surrogate.prototype = parentClass.prototype;\n      childClass.prototype = new Surrogate();\n      childClass.prototype.constructor = childClass;\n   },\n\n   randomVec(length) {\n      const deg = 2 * Math.PI * Math.random();\n      return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n   },\n   // Scale the length of a vector by the given amount.\n   scale(vec, m) {\n      return [vec[0] * m, vec[1] * m];\n   }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;