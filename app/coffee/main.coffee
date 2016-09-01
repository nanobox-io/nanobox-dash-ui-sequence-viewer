sequenceWrapper  = require 'jade/sequence-wrapper'
abbreviatedCount = require 'jade/abbreviated'
Sequence         = require 'components/sequence'
SequenceParent   = require 'components/sequence-parent'
DataNormalizer   = require 'misc/data-normalizer'

class SequenceViewer extends SequenceParent

  constructor : (@$el, config) ->

    @sequences = {}

    @$node = $ sequenceWrapper( {} )

    # If this is in the abbreviated state:
    if config.isAbbrev
      @isAbbrev   = true
      @$abbr      = $ abbreviatedCount( {url:config.dashUrl} )
      @$abbrCount = $ '.count', @$abbr
      @$node.addClass 'abbreviated'
      @$node.prepend @$abbr


    @$el.append @$node
    castShadows @$node

    @$children = $ '.sequences', @$node
    @$el.append @$node
    $(".trans-close-btn", @$node).click @minimize

    PubSub.subscribe 'sequence.retry', (m, data)-> config.retryCb data
    super Sequence

    @$sequenceWrapper = $ ".sequence-wrapper", @$el
    @$sequenceWrapper.length

  # ------------------------------------ API

  update : (@arrayOfPackets) ->
    normalizer = new DataNormalizer()
    @arrayOfPackets = normalizer.normalize @arrayOfPackets

    if @arrayOfPackets.length > 0
      @checkForErrors()
      @show()
    else
      @hide()
    @packet = {children:@arrayOfPackets}
    if @isAbbrev
      @$abbrCount.text @countTasks @arrayOfPackets, 0
    super()


  # ------------------------------------  HIDING / SHOWING

  hideIfNosequences : () ->
    if Object.keys( @sequences ).length == 0 then @hide()

  hide : () ->
    setTimeout ()=>
      @$sequenceWrapper.addClass 'empty'
    ,
      1500

  show : () ->
    @$sequenceWrapper.removeClass 'empty'

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

  countTasks : (packets) ->
    return 0 if !packets?
    totalTasks = packets.length
    for packet in packets
      totalTasks += @countTasks packet.children
    return totalTasks

  checkForErrors : () ->
    if @containsErrors( @arrayOfPackets)
      @$sequenceWrapper.addClass "has-errors"
    else
      @$sequenceWrapper.removeClass "has-errors"

  containsErrors : (ar) ->
    for packet in ar
      if packet.error? || packet.internal_error?
        return true
      if packet.children?
        if @containsErrors packet.children
          return true
    return false

window.nanobox ||= {}
nanobox.SequenceViewer = SequenceViewer
