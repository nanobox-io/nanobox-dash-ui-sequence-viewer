Tester = require './shims/data-shim'


window.tester = new Tester()
onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"
onSequenceSkipClick  = (data) -> console.log "Skipping Errored Sequence : #{data}"

data =
  retryCb  : onSequenceRetryClick
  skipCb   : onSequenceSkipClick
  isAbbrev : true
  dashUrl  : "http://some.site/asdfion309ua93b3a"

sequence = new nanobox.SequenceViewer( $("#sequence-viewer"), data )

clear = -> sequence.clearAllsequences()

window.simulateStormpackUpdate = (data)->
  sequence.update data

simulateStormpackUpdate [ tester.newStruct ]

# ------------------------------------ Stage UI

$('.stage-ui select').on 'change', (e)->
  val = $(e.currentTarget).val()
  if val == 'empty'
    simulateStormpackUpdate []
  else
    simulateStormpackUpdate [ tester[val] ]
