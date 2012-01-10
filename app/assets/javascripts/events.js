// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
   $("a.drawer_toggle").click(function(){
       $(this).parent(".event").find(".event_drawer").slideToggle();
       $(this).parent(".event").find(".twirl").toggleClass("down");
   });
});