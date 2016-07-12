sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el, @data, @retryCb, @skipCb) ->
    @isFullScreen = false
    @$node = $ sequenceError( @data )
    $el.append @$node
    castShadows @$node

    $(".stack-trace-btn", @$node).on 'click', ()=> @toggleFullScreen()
    $(".retry-btn", @$node).on 'click',       ()=> @retryCb()
    $(".skip-btn", @$node).on 'click',        ()=> @skipCb()

    # Animate height / opacity
    setTimeout ()=>
      @$node.removeClass 'hidden'
    ,
      50


  toggleFullScreen : () ->
    if @isFullScreen
      @minimize()
    else
      @goFullScreen()
    @isFullScreen = !@isFullScreen

  minimize : ()->
    @$node.addClass 'faded'
    setTimeout ()=>
      @$node.removeClass 'faded'
      @$node.removeClass 'full-screen'
    ,
      400

  goFullScreen : () ->
    @$node.addClass 'faded'
    setTimeout ()=>
      @$node.addClass 'full-screen'
      @$node.removeClass 'faded'
    ,
      400

  hide : (doDestroy=false) ->
    @$node.addClass 'hidden'
    if doDestroy
      setTimeout ()=>
        @destroy()
      ,
        650


  destroy : () ->
    $(".retry-btn", @$node).off()
    $(".stack-trace-btn", @$node).off()
    @$node.remove()
