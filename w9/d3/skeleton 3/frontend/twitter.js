var followToggle = require('./follow_toggle.js');
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
