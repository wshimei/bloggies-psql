/* global $ alert */

$(document).on('turbolinks:load', function () {
  $('.static').ready(function () {
    // check if we'are at static pages
    // load on static pages views
    alert('loaded static page change')
  })

  $('.posts.show').ready(function () {
  // check if we're at posts pages
  // load on static posts views
    $.get('/tags', function (data) {
      data.forEach(function (d) {
        var newList = $('<li>').text(d.name)
        $('#tags').append(newList)
      })
    })
  })

  $('.posts.edit').ready(function () {
    $.get('/posts/:id/edit', function (post) {
      console.log(post)
    })
  })
})
