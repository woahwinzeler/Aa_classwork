var followToggle = require('./follow_toggle.js');
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
