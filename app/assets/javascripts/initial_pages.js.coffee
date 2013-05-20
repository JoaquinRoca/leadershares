# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $("#slider1").slider({ value: 50 })

$ ->
  $("#slider2").slider({ value: 50 })

$ ->
	$("#slider3").slider({ value: 50 })

$ ->
  $("#slider4").slider({ value: 50 })

$ ->
  $("#slider5").slider({ value: 50 })

$ ->
	$("#slider6").slider({ value: 50 })

$ ->
  $("#slider7").slider({ value: 50 })

$ ->
  $("#slider8").slider({ value: 50 })

$ ->
	$("#slider9").slider({ value: 50 })


# This is supposed to add to the rater lists
appendText = ->
  txt3 = document.createElement("p")
  txt3.innerHTML = "Text." # Create text with DOM
  $("form").append txt3 # Append new elements

# This is for the rater add lists
$ ->
  $("#friends li").draggable
    appendTo: "body"
    helper: "clone"

  $("#raters ol").droppable(
    activeClass: "ui-state-default"
    hoverClass: "ui-state-hover"
    accept: ":not(.ui-sortable-helper)"
    drop: (event, ui) ->
      $(this).find(".placeholder").remove()
      $("<li></li>").text(ui.draggable.text()).appendTo this
  ).sortable
    items: "li:not(.placeholder)"
    sort: ->
      $(this).removeClass "ui-state-default"