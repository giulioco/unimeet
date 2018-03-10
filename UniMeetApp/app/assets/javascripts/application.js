// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require dropzone
//= require imagedrop
//= require confetti
//= require_tree .
//= require_tree ./channels

ImageDrop.checkFileType = function(file) {
      var ext, fileTypes;
      ext = file.name.substring(file.name.lastIndexOf('.')).toLowerCase();
      fileTypes = ".jpeg , .jpg , .png , .bmp, .gif , .webp , .svg";
      if (fileTypes.toLowerCase().indexOf(ext) < 0) {
        alert("That doesn't appear to be an image file.");
        return false;
      } else {
        return true;
      }
};
    
function flip() {
  $('#card-flipper').css('z-index', '999');
  $('.swipe-card').toggleClass('flipped');
  $('#flip-button').toggleClass('flipped');
  setTimeout(function(){$('#card-flipper').css('z-index', 'auto')}, 1000);
  
};

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
