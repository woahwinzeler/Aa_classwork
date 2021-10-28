/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {



class FollowToggle {
  constructor(el){
    //error is coming from the 2 lines below 
    this.$el = $(el);
    this.userId = this.$el.data('user-id');
    this.followState = this.$el.data('initial-follow-state'); 
    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  }

  render() {
    debugger 
    //this.followState is a boolean
    if(this.followState) {
      this.$el.text("unfollow");
      // this.followState = 'follow';
      // this.$el.attr('data-initial-follow-state', 'follow');
    } else {
      this.$el.text("follow");
      // this.followState = 'unfollow';
      // this.$el.attr('data-initial-follow-state', 'unfollow');
    }
  }

  handleClick(e){
    debugger 
    e.preventDefault();
    let that = this;
    let successfulUnfollow = (response) => {
      console.log(response)
      console.log("Unfollow")
      that.followState = "unfollow"
      that.$el.data('initial-follow-state', false);
      that.render(); 
    }
    let successfulFollow = (response) => {
      console.log(response)
      console.log("Follow")
      that.followState = "follow"
      that.$el.data('initial-follow-state', true);
      that.render(); 
    }

    if (!this.followState){
    //AJAX request 
      debugger 
      $.ajax ({
        method: 'POST',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(successfulFollow)
    } 
    else {
      $.ajax ({
        method: 'DELETE',
        url: `/users/${this.userId}/follow`, 
        datatype: "JSON"
      }).then(successfulUnfollow)
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
    console.log(followToggle);
    console.log($submitButton[index]);
    buttons.push(new followToggle($submitButton[index]));
  });
});

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map