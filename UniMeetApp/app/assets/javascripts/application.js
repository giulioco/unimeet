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
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require dropzone
//= require imagedrop
//= require confetti
//= require_tree .
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
    $('.swipe-card').toggleClass('flipped');
};

  function roll() {
    $('.swipe-card').toggleClass('rolled');
};