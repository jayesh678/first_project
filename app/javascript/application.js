// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

$(function () {
  var flashDurationInSeconds = 5;
  var flashContainerId = "flash-messages";
  function removeFlashMessages() {
    $("#" + flashContainerId).remove();
  }
  setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
});

$(document.body).on("click", ".digg_pagination a", function () {
  // window.location.reload();
  setTimeout(function () {
    location.reload();
  }, 100);
  //your code goes here..
});
