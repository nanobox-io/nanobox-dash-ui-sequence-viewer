Progress       = require 'components/progress'
SequenceError  = require 'components/sequence-error'
sequence       = require 'jade/sequence'
SequenceParent = require 'components/sequence-parent'

module.exports = class Sequence extends SequenceParent

  # Init
  constructor: ($el, @data) ->
    @scrubData @data
    @build $el, @data
    super Sequence

  build : ($el, @data) ->
    @$node        = $ sequence( @data )
    @$children    = $ ".children", @$node
    @$content     = $ ".content", @$node
    @$metaMessage = $ ".meta-message", @$node
    $el.append @$node
    if  @data.viewClass != 'root'
      @progressBar = new Progress $(".progress", @$node), @data.estimate

    setTimeout ()=>
      @$content.addClass "open"
    ,
      50

  # ------------------------------------ UPDATE

  update : ( @packet ) ->
    @updateContent()
    super()
    @addOrRemoveError()

  updateContent : () ->
    $(".state", @$content).text @formatStatus(@packet.status)

  addOrRemoveError : () ->
    internalError = false
    otherError    = false
    # if there is an error to show, and there isn't and existing error
    # TODO: Check to see if the new error is the same code as the existing error
    if @packet.error? && !@error?
      otherError = true
      @error = new SequenceError $('>.error',@$node), @packet.error, @onErrorRetry
      @$node.addClass "errored"
      @progressBar?.stop()
      # PubSub.publish 'progress.bars.halt', "#{@data.macroId}.#{@data.name}"

    # if there is no error to show, but one is currently shown
    else if !@packet.error? && @error?
      @$node.removeClass "errored"
      @error.hide true
      @error = null
      @progressBar?.start()

    if @packet.internal_error
      internalError = true
      @$node.addClass "internal-error"
    else
      @$node.removeClass "internal-error"

    if internalError or otherError
      @progressBar?.stop()
    else
      @progressBar?.start()

  # ------------------------------------ Completing / Deleting

  complete : () ->
    @completeStylesAndText()
    if @progressBar?
      @progressBar.complete()
    setTimeout ()=>
      @$content.addClass 'hidden'
      setTimeout ()=>
        @$content.removeClass 'open'
        setTimeout ()=>
          @remove()
        ,
          600
      ,
        200
    ,
      600

  delete : () ->
    @markAllChildrenForDeletion()
    @deleteCompleteChildren()
    @complete()

  completeStylesAndText : () ->
    @error?.hide true
    @$metaMessage.text " - Complete!"
    @$node.addClass "complete"

  finishAndShowNew : (sequenceData) ->
    @packet = @data = sequenceData
    @completeStylesAndText()
    if @progressBar?
      @progressBar.complete true

    # Reset the progress bar with the new sequence
    setTimeout ()=>
      @progressBar.reset @data.estimate
      @$node.removeClass "complete"
      @$metaMessage.text ''
      $(".message", @$node).text @data.message
      @addOrRemoveError()
    ,
      1000


  deleteImmediately : () ->
    @delete()
    @remove()

  remove : () ->
    @$node.remove()

  # ------------------------------------ Errors

  onErrorRetry : () =>
    PubSub.publish 'sequence.retry', @packet.error.retry_path
    @error.hide true
    @error = null

  # ------------------------------------ Helpers

  scrubData : (data) ->
    data.viewClass ||= ""

  formatStatus : (status)->
    switch status
      when 'queued', 'errored'
        return status
      else
        return 'Running'
