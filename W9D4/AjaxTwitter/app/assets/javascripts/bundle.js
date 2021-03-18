/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = required('./follow_toggle.js');
$(()=>{
  $('.follow-toggle').each((idx, button)=>{
    new FollowToggle(button);
  })
})


// $('.follow-toggle').on('click', ((event)=>{

//   event.preventDefault();
//   let follow = new FollowToggle(); //pass the button
//   return follow;
// }))
/******/ })()
;
//# sourceMappingURL=bundle.js.map