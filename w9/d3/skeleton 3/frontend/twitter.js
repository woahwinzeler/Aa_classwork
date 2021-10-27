var followToggle = require('./follow_toggle.js');
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
