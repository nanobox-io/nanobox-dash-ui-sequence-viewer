task = require 'jade/task'
SequenceError = require 'components/sequence-error'

module.exports = class MacroTask

  constructor: (@$el, @data) ->
    console.log @data
    @data.displayName ||= @data.name

    displayName = if @data.displayName == "default" then 'core' else @data.displayName

    @$node   = $ task( {name : displayName} )
    @$el.append @$node
    @height  = 0
    @tries   = 1

    # If this is the default sequence, move it to the front, and add "core"
    if displayName == "core"
      @$node.prependTo @$el
      @$node.addClass "core"
    else
      @$el.append @$node

    # @$node = $( @$node, @$el )
    @initShow()

    @$progressBar = $('.progress', @$node)
    @perc         = 0

    PubSub.subscribe 'progress.bars.halt', (m,data) =>
      if @isPartOfCohort data
        @addError()

    PubSub.subscribe 'progress.bars.resume', (m,data) =>
      if @isPartOfCohort data
        @removeError()


  isPartOfCohort : (id) ->
    return id.indexOf(@data.name) != -1 && id.indexOf(@data.macroId) != -1

  # ---------------------- Bar

  move : () ->
    return if @paused
    @perc += Math.random() * @blockSize
    if @perc < 100
      @$progressBar.velocity "stop", true
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

    # if there is an error to show, and there isn't and existing error
    # TODO: Check to see if the new error is the same code as the existing error
    if error? && !@error?
      @error = new SequenceError @$node, error, "#{@data.macroId}.#{@data.name}"
      PubSub.publish 'progress.bars.halt', "#{@data.macroId}.#{@data.name}"
    # if there is no error to show, but one is currently shown
    else if !error? && @error?
      @error.clearMe()

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
    if @error
      @removeError()
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
        if @parentTask?
          @parentTask.shrink 300
        @$node.velocity {height:0, "margin-bottom":0;},
          duration:300
          easing:"easeInOutQuint"
          complete: ()=>
            @$node.remove()

  setMessageHtml : (message) ->
    $('.message', @$node).text(message)

  initShow : () ->
    @$node.css opacity:0, height:"0px"
    @$node.velocity {opacity:1}, {duration:600, easing:"easeInOutQuint"}
    @grow()

  grow : (duration) ->
    @height += 36
    @resize duration

  shrink : (duration=200, delay=0) ->
    @height -= 36
    @resize duration, delay

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
    @$node.velocity {height: @height}, {duration:duration, easing:"easeInOutQuint", delay:delay}
