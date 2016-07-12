sequenceWrapper = require 'jade/sequence-wrapper'
Sequence        = require 'components/sequence'
SequenceParent  = require 'components/sequence-parent'

class SequenceViewer extends SequenceParent

  constructor : (@$el, config) ->

    @sequences = {}

    @$node = $ sequenceWrapper( {} )
    @$el.append @$node


    @$children = $ '.sequences', @$node
    @$el.append @$node
    $(".trans-close-btn", @$node).click @minimize

    PubSub.subscribe 'sequence.retry', (m, data)-> config.retryCb data
    PubSub.subscribe 'sequence.skip',  (m, data)-> config.skipCb data
    super Sequence

  # ------------------------------------ API

  update : (@arrayOfPackets) ->
    @packet = {children:@arrayOfPackets}
    super()


  # ------------------------------------  HIDING / SHOWING

  hideIfNosequences : () ->
    if Object.keys( @sequences ).length == 0 then @hide()

  hide : () -> @$el.css display:'none'
  show : () -> @$el.css {opacity:1, display:'inline-block'}

  minimize : (e) =>
    if @isMinimized then return
    @$node.click @unMinimize
    @$node.addClass "minimized"
    e.stopPropagation()
    @isMinimized = true

  unMinimize : () =>
    if !@isMinimized then return
    @isMinimized = false
    @$node.removeClass "minimized"

window.nanobox ||= {}
nanobox.SequenceViewer = SequenceViewer
