sequenceError = require 'jade/sequence-error'

module.exports = class SequenceError

  constructor: ($el, data, @id) ->
    @isFullScreen = false
    @$node = $ sequenceError( data )
    $el.append @$node
    @$node.css opacity:0
    @$node.velocity {opacity:1}, {duration:0, delay:10}
    castShadows @$node

    $(".stack-trace-btn", @$node).on 'click', ()=> @toggleFullScreen()
    $(".retry-btn", @$node).on 'click',       ()=>
      PubSub.publish 'progress.bars.resume', @id
      PubSub.publish 'sequence.retry', data.id


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

  destroy : () ->
    $(".retry-btn", @$node).off()
    $(".stack-trace-btn", @$node).off()
    @$node.velocity {opacity:0}, {duration:500, complete:()=>
      @$node.remove()
    }
