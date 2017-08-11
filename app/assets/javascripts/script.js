/* global $ alert */

$(document).on('turbolinks:load', function () {
  $('.static').ready(function () {
    // check if we'are at static pages
    // load on static pages views
    alert('loaded static page change')
  })

  $('.posts').ready(function () {
  // check if we're at posts pages
  // load on static posts views
    alert('loaded post page change')
  })
})
