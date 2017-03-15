sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el, @data, @retryCb) ->
    @isFullScreen = false
    @convertMetaHashToString @data
    @$node = $ sequenceError( @data )
    $el.append @$node
    castShadows @$node

    $(".stack-trace-btn", @$node).on 'click', ()=> @toggleFullScreen()
    $(".retry-btn", @$node).on 'click',       ()=> @retryCb()

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

  # ------------------------------------ Helpers

  convertMetaHashToString : (obj) ->
    # Find the largest key
    largestKey = 0
    for key, val of obj.meta
      if key.length > largestKey then largestKey = key.length

    str = ""
    for key, val of obj.meta
      # Add spaces so the colons all align-items
      space = ""
      totalSpaces = largestKey - key.length;
      space += " " for [0..totalSpaces]
      str += "#{key}#{space}: #{val}\n"

    if str.length > 0
      obj.hasMeta = true
    obj.metaString = str
