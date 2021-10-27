/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {



class FollowToggle {
  constructor(el){
    this.userId = el.user-id;
    this.followState = el.initial-follow-state; 
    this.el = el;
    this.render();
  }

  render() {
    if(this.followState === "unfollowed") {
      el.text("follow");
    } else {
      el.text("unfollow");
    }
  }

}

module.exports = FollowToggle; 

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
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
var followToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");
// const FollowToggle = require('./follow_toggle');


const $submitButton = $('.followToggle'); 

$submitButton.each(function (button){
  //pass in follow toggle constructor
  let newButton = new FollowToggle();
})

$( document ).ready(function () {
  const $submitButton = $('.followToggle'); 

$submitButton.each(function (index){
  //pass in follow toggle constructor
  let newButton = new FollowToggle($submitButton[index]);
});
}) 

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map