sequenceWrapper = require 'jade/sequence-wrapper'
MacroSequence    = require 'components/macro-sequence'

class SequenceViewer

  constructor: (@$el) ->
    window.sequence   = @
    @sequences       = {}

    @$node = $ sequenceWrapper( {} )
    @$el.append @$node


    @sequencesHolder = $ '.sequences', @$node
    @$el.append @$node
    $(".trans-close-btn", @$node).click @minimize

  ###########
  ### API ###
  ###########

  onStormpackUpdate : (packet) ->
    @createAndUpdatesequences packet
    @hideIfNosequences()

  clearAllsequences : () ->
    # if sequence exists, return it
    for key, sequence of @sequences
      sequence.deleteImmediately()

    @sequences = {}
    @sequencesHolder.empty()
    @$el.css display:'none'


  ###   //     // //////// //       ////////  //////// ////////   //////
        //     // //       //       //     // //       //     // //    //
        //     // //       //       //     // //       //     // //
        ///////// //////   //       ////////  //////   ////////   //////
        //     // //       //       //        //       //   //         //
        //     // //       //       //        //       //    //  //    //
        //     // //////// //////// //        //////// //     //  //////   ###


  createAndUpdatesequences : (packet) ->
    for sequenceData in packet
      sequence = @getOrCreatesequence sequenceData

      # If tranaction really exists
      if sequence != null
        deleted = sequence.update sequenceData

        if deleted
          delete @sequences[sequenceData.id]

        if Object.keys( @sequences ).length != 0
          @show()

  getOrCreatesequence : ( sequenceData ) ->
    if @sequences[sequenceData.id]?
      return @sequences[sequenceData.id]

    # If sequence is already complete, don't create
    if sequenceData.state == "complete"
      return null

    # sequence doesn't exist, create and return it
    sequence = new MacroSequence @sequencesHolder, sequenceData
    @sequences[sequenceData.id] = sequence

    return sequence

  hideIfNosequences : () ->
    if Object.keys( @sequences ).length == 0 then @hide()

  hide : () ->
    @$el.delay(1200).animate {opacity:0},
      duration:250
      complete:()=>
        @$el.css display:'none'

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
