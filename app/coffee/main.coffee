sequenceWrapper = require 'jade/sequence-wrapper'
# MacroSequence   = require 'components/macro-sequence'
Sequence        = require 'components/sequence'

class SequenceViewer

  constructor : (@$el, retryCb) ->
    @sequences = {}

    @$node = $ sequenceWrapper( {} )
    @$el.append @$node


    @sequencesHolder = $ '.sequences', @$node
    @$el.append @$node
    $(".trans-close-btn", @$node).click @minimize

    PubSub.subscribe 'sequence.retry', (m, data)-> retryCb data

  ###########
  ### API ###
  ###########

  onStormpackUpdate : (@packet) ->
    @markAllSequencesForDeletion()
    @createAndUpdatesequences()
    @completeFinishedSequences()
    @hideIfNosequences()

  clearAllsequences : () ->
    # if sequence exists, return it
    for key, sequence of @sequences
      sequence.deleteImmediately()

    @sequences = {}
    @sequencesHolder.empty()
    @$el.css display:'none'

  ###############
  ### HELPERS ###
  ###############

  markAllSequencesForDeletion : () ->
    @doomedSequences = []
    for key, sequence of @sequences
      @doomedSequences[key] = sequence


  createAndUpdatesequences : () ->
    for sequenceData in @packet
      sequence = @getOrCreatesequence sequenceData

      # If tranaction really exists
      if sequence != null
        deleted = sequence.update sequenceData

        # if deleted
        #   delete @sequences[sequenceData.id]

        if Object.keys( @sequences ).length != 0
          @show()

  completeFinishedSequences : () ->



  getOrCreatesequence : ( sequenceData ) ->
    # If sequence exists
    if @sequences[sequenceData.id]?
      return @sequences[sequenceData.id]

    # sequence doesn't exist, create and return it
    sequence = new Sequence @sequencesHolder, sequenceData
    @sequences[sequenceData.id] = sequence

    return sequence

  # ------------------------------------  HIDING / SHOWING

  hideIfNosequences : () ->
    if Object.keys( @sequences ).length == 0 then @hide()

  hide : () ->
    @$el.css display:'none'

    # @$el.velocity {opacity:0},
    #   delay:1200
    #   duration:250
    #   complete:()=>
    #     @$el.css display:'none'

  show : () ->
    @$el.css {opacity:1, display:'inline-block'}

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
