sequenceWrapper = require 'jade/sequence-wrapper'
MacroSequence    = require 'components/macro-sequence'

class SequenceViewer

  constructor: (@$el) ->
    window.transactor   = @
    @transactions       = {}

    @$node = $ sequenceWrapper( {} )
    @$el.append @$node


    @transactionsHolder = $ '.transactions', @$node
    @$el.append @$node
    $(".trans-close-btn", @$node).click @minimize

  ###########
  ### API ###
  ###########

  onStormpackUpdate : (packet) ->
    @createAndUpdateTransactions packet
    @hideIfNoTransactions()

  clearAllTransactions : () ->
    # if transaction exists, return it
    for key, transaction of @transactions
      transaction.deleteImmediately()

    @transactions = {}
    @transactionsHolder.empty()
    @$el.css display:'none'


  ###   //     // //////// //       ////////  //////// ////////   //////
        //     // //       //       //     // //       //     // //    //
        //     // //       //       //     // //       //     // //
        ///////// //////   //       ////////  //////   ////////   //////
        //     // //       //       //        //       //   //         //
        //     // //       //       //        //       //    //  //    //
        //     // //////// //////// //        //////// //     //  //////   ###


  createAndUpdateTransactions : (packet) ->
    for transactionData in packet
      transaction = @getOrCreateTransaction transactionData

      # If tranaction really exists
      if transaction != null
        deleted = transaction.update transactionData

        if deleted
          delete @transactions[transactionData.id]

        if Object.keys( @transactions ).length != 0
          @show()

  getOrCreateTransaction : ( transactionData ) ->
    if @transactions[transactionData.id]?
      return @transactions[transactionData.id]

    # If transaction is already complete, don't create
    if transactionData.state == "complete"
      return null

    # Transaction doesn't exist, create and return it
    transaction = new MacroSequence @transactionsHolder, transactionData
    @transactions[transactionData.id] = transaction

    return transaction

  hideIfNoTransactions : () ->
    if Object.keys( @transactions ).length == 0 then @hide()

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
