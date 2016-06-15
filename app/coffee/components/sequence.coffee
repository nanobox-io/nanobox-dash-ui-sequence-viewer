Progress      = require 'components/progress'
SequenceError = require 'components/sequence-error'
sequence      = require 'jade/sequence'

module.exports = class Sequence

  # Init
  constructor: ($el, @data) ->
    @scrubData @data
    @build $el, @data

  build : ($el, @data) ->
    @$node        = $ sequence( @data )
    @$children    = $ ".children", @$node
    @$content     = $ ".content", @$node
    @$metaMessage = $ ".meta-message", @$node
    $el.append @$node
    @children = {}
    if  @data.viewClass != 'root'
      @progressBar = new Progress $(".progress", @$node), @data.estimate

    setTimeout ()=>
      @$content.addClass "open"
    ,
      50

  # ------------------------------------ UPDATE

  update : ( @packet ) ->
    @updateContent()
    @markAllChildrenForDeletion()
    @createAndUpdateChildren()
    @addOrRemoveError()
    @deleteCompleteChildren()

  updateContent : () ->

    $(".state", @$content).text @packet.status
  createAndUpdateChildren : () ->
    for sequenceData in @packet.children
      # If it doesn't exist, create it
      if !@children[sequenceData.id]?
        @children[sequenceData.id] = new Sequence @$children, sequenceData
      # Update
      @children[sequenceData.id].update sequenceData
      delete @doomedChildren[sequenceData.id]

  markAllChildrenForDeletion : () ->
    @doomedChildren = {}
    for key, child of @children
      @doomedChildren[key] = child

  addOrRemoveError : () ->
    # if there is an error to show, and there isn't and existing error
    # TODO: Check to see if the new error is the same code as the existing error
    if @packet.error? && !@error?
      @error = new SequenceError $('>.error',@$node), @packet.error, @onErrorRetry
      @progressBar?.stop()
      # PubSub.publish 'progress.bars.halt', "#{@data.macroId}.#{@data.name}"
    # if there is no error to show, but one is currently shown
    else if !@packet.error? && @error?
      @error.hide true
      @error = null
      @progressBar?.start()

  deleteCompleteChildren : () ->
    for key, child of @doomedChildren
      child.delete()
      delete @children[key]
    @doomedChildren = null

  # ------------------------------------ Completing / Deleting

  complete : () ->
    @error?.hide true
    @$metaMessage.text " - Complete!"
    @$node.addClass "complete"
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


  deleteImmediately : () ->
    @delete()
    @remove()

  remove : () ->
    @$node.remove()

  # ------------------------------------ Errors

  onErrorRetry : () =>
    PubSub.publish 'sequence.retry', @packet.id
    @error.hide true
    @error = null

  # ------------------------------------ Helpers

  scrubData : (data) ->
    data.viewClass ||= ""
