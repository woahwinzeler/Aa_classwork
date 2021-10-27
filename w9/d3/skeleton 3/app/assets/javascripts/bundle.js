/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {



class FollowToggle {
  constructor(el){
    this.userId = el.data-user-id;
    this.followState = el.data-initial-follow-state; 
    // this.el = el;
    // this.render();
    // this.handleClick()
  }

  render() {
    if(this.followState === "unfollowed") {
      this.el.text("follow");
      this.followState = 'follow';
      this.el.attr('data-initial-follow-state', 'follow');
    } else {
      this.el.text("unfollow");
      this.followState = 'unfollow';
      this.el.attr('data-initial-follow-state', 'unfollow');
    }
  }

  handleClick(e){
    e.preventDefault();

    let success = (response) => {
      this.render(); 
    }

    if (this.followState === "unfollowed")
    //AJAX request 
      $.ajax ({
        method: 'POST',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(success)
    else {
      $.ajax ({
        method: 'DELETE',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(success)
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

let buttons = [];
$( document ).ready(function () {
  const $submitButton = $('.followToggle'); 

$submitButton.each(function (index){
  //pass in follow toggle constructor
  console.log(followToggle);
  console.log($submitButton[index]);
  buttons.push(new followToggle($submitButton[index]));
});
}) 

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map