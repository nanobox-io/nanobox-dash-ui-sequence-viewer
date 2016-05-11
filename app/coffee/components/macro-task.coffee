task = require 'jade/task'
SequenceError = require 'components/sequence-error'

module.exports = class MacroTask

  constructor: (@$el, @data) ->
    @data.displayName ||= @data.name

    displayName = if @data.displayName == "default" then 'core' else @data.displayName

    @$node   = $ task( {name : displayName} )
    @$el.append @$node
    @height  = 0
    @tries   = 1

    # If this is the default sequence, move it to the front, and add "core"
    if @name == "core"
      @$node.prependTo @$el
      @$node.addClass "core"
    else
      @$el.append @$node

    # @$node = $( @$node, @$el )
    @initShow()

    @$progressBar = $('.progress', @$node)
    @perc         = 0

    PubSub.subscribe 'progress.bars.halt', (m,data) =>
      if data.indexOf(@data.name) != -1
        @addError()

    PubSub.subscribe 'progress.bars.resume', (m,data) =>
      if data.indexOf(@data.name) != -1
        @removeError()


  # ---------------------- Bar

  move : () ->
    return if @paused
    @perc += Math.random() * @blockSize
    if @perc < 100
      @$progressBar.stop true, false
      @$progressBar.velocity {width:"#{@perc}%"},
        delay: Math.random()*300
        duration:800*Math.random() + 100
        complete:()=> @move()
    else
      @perc = 0
      @setMessageHtml "#{@currentMessage} - progression #{++@tries}"
      @stopProgressbar()
      @$progressBar.css width:"0"
      @startProgressbar()

  show : (delay=0) ->
    if @longRunner
      @setMessageHtml "#{@currentMessage} - Typically takes up to 24 hrs"
    else
      @setMessageHtml @currentMessage
      @move()

  stopProgressbar:  ()-> @paused = true
  startProgressbar: ()-> @paused = false; @move()

  currentMessage : ""
  update : (message, estimate, error) ->
    if @currentMessage != message
      if @currentMessage != ""
        @finishCurrentMessage message, estimate
      else
        @initializeNewMessage message, estimate

    if error? && !@error?
      @error = new SequenceError @$node, error, "#{@data.macroId}.#{@data.name}"
      PubSub.publish 'progress.bars.halt', "#{@data.macroId}.#{@data.name}"

  initializeNewMessage : (@currentMessage, estimate) ->
    @tries = 1
    @$node.removeClass "complete"
    @setMessageHtml @currentMessage

    @$progressBar.css opacity:1, width:0
    time = estimate*3
    time *= 1.5
    if time <  6000 then time = 6000
    if time >= 86400000 then @longRunner = true
    @blockSize = 110000 / time
    @show()


  finishCurrentMessage : (message, estimate) ->
    @stopProgressbar()
    @setMessageHtml @currentMessage + " - Complete!"
    @$node.addClass "complete"
    @$progressBar.velocity {width:"100%"}, {duration:700, easing:'easeInOutQuint'}
    @$progressBar.velocity {opacity:0},
      delay:500
      duration:300
      complete: ()=>
        if !message?
          @remove()
        else
          @initializeNewMessage message, estimate

  finishAndDelete : ()->
    @$node.addClass "complete"
    @finishCurrentMessage()

  remove : () ->
    @$node.velocity {opacity:0},
      duration:400
      complete: ()=>
        @$node.velocity {height:0},
          duration:200
          complete: ()=>
            @$node.remove()

  setMessageHtml : (message) ->
    $('.message', @$node).text(message)

  initShow : () ->
    @$node.css opacity:0, height:"0px"
    @$node.velocity {opacity:1}, {duration:600, easing:"easeInOutQuint"}
    @grow()

  grow : (duration) ->
    @height += 31
    @resize duration

  shrink : () ->
    @height -= 31
    @resize null, 2000

  addError : () ->
    @stopProgressbar()
    @height += 110
    @resize()

  removeError : () ->
    @height -= 110
    @resize()
    @startProgressbar()
    @move()
    if @error?
      @error.destroy()
      @error = null

  resize : (duration=600, delay=0) ->
    @$node.animate {height: @height}, {duration:600, easing:"easeInOutQuint", delay:delay}
