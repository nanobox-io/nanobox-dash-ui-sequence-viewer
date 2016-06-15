sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el, @data, @retryCb) ->
    @isFullScreen = false
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
    $(@$node).velocity({opacity:0}, {duration:200, complete:()=>
      $(@$node).velocity {opacity:1}, {duration:200}
      @$node.removeClass 'full-screen'
    })

  goFullScreen : () ->
    $(@$node).velocity({opacity:0}, {duration:200, complete:()=>
      $(@$node).velocity {opacity:1}, {duration:35}
      @$node.addClass 'full-screen'
    })

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
