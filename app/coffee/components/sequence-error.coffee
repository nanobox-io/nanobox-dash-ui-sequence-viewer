sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el, data) ->
    @isFullScreen = false
    @$node = $ sequenceError( data )
    $el.append @$node
    castShadows @$node

    console.log data

    $(".stack-trace-btn", @$node).on 'click', ()=> @toggleFullScreen()


  toggleFullScreen : () ->
    if @isFullScreen
      @minimize()
    else
      @goFullScreen()
    @isFullScreen = !@isFullScreen

  minimize : ()->
    @$node.removeClass 'full-screen'

  goFullScreen : () ->
    @$node.addClass 'full-screen'
