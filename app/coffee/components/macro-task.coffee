task = require 'jade/task'
SequenceError = require 'components/sequence-error'

module.exports = class MacroTask

  constructor: (@$el, data) ->
    name     = if data.name == "default" then 'core' else data.name

    @$node   = $ task( {name : name} )
    @$el.append @$node

    @height  = 0
    @tries   = 1

    @namer = name

    # If this is the default sequence, move it to the front, and add "core"
    if name == "core"
      @$node.prependTo @$el
      @$node.addClass "core"
    else
      @$el.append @$node

    @$holder = $( @$node, @$el )
    @initShow()

    @$progressBar = $('.progress', @$holder)
    @perc         = 0

  # ---------------------- Bar

  move : () ->
    @perc += Math.random() * @blockSize
    if @perc < 100
      @$progressBar.delay(Math.random()*300).animate {width:"#{@perc}%"},
        duration:800*Math.random() + 100
        complete:()=> @move()
    else
      @perc = 0
      @setMessageHtml "#{@currentMessage} - progression #{++@tries}"
      @stopProgressbar()
      @$progressBar.css width:"0"
      @move()

  show : (delay=0) ->
    if @longRunner
      @setMessageHtml "#{@currentMessage} - Typically takes up to 24 hrs"
    else
      @setMessageHtml @currentMessage
      @move()

  stopProgressbar: ()->
    @$progressBar.stop true

  currentMessage : ""
  update : (message, estimate, error) ->
    if @currentMessage != message
      if @currentMessage != ""
        @finishCurrentMessage message, estimate
      else
        @initializeNewMessage message, estimate

    if error?
      @error = new SequenceError @$node, error
      @stopProgressbar()
      @addError()

  initializeNewMessage : (@currentMessage, estimate) ->
    @tries = 1
    @$holder.removeClass "complete"
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
    @$holder.addClass "complete"
    @$progressBar.animate {width:"100%"}, {duration:700, easing:'easeInOutQuint'}
    @$progressBar.delay(500).animate {opacity:0},
      duration:300
      complete: ()=>
        if !message?
          @remove()
        else
          @initializeNewMessage message, estimate

  finishAndDelete : ()->
    @$holder.addClass "complete"
    @finishCurrentMessage()

  remove : () ->
    @$holder.animate {opacity:0},
      duration:400
      complete: ()=>
        @$holder.animate {height:0},
          duration:200
          complete: ()=>
            @$holder.remove()

  setMessageHtml : (message) ->
    $('.message', @$node).text(message)

  initShow : () ->
    @$holder.css opacity:0, height:"0px"
    @$holder.animate {opacity:1}, {duration:600, easing:"easeInOutQuint"}
    @grow()

  grow : (duration) ->
    @height += 31
    @resize duration

  shrink : () ->
    @height -= 31
    @resize null, 2000

  addError : () ->
    @height += 110
    @resize()

  resize : (duration=600, delay=0) ->
    @$holder.animate {height: @height}, {duration:600, easing:"easeInOutQuint", delay:delay}
