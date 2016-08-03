Tester = require './shims/data-shim'


tester = new Tester()
onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"
onSequenceSkipClick  = (data) -> console.log "Skipping Errored Sequence : #{data}"

data =
  retryCb : onSequenceRetryClick
  skipCb  : onSequenceSkipClick

sequence = new nanobox.SequenceViewer( $("#sequence-viewer"), data )

clear = -> sequence.clearAllsequences()

window.simulateStormpackUpdate = (data)->
  sequence.update data

# simulateStormpackUpdate [ tester.newStruct ]

# ------------------------------------ Stage UI

$('.stage-ui select').on 'change', (e)->
  val = $(e.currentTarget).val()
  if val == 'empty'
    simulateStormpackUpdate []
  else
    simulateStormpackUpdate [ tester[val] ]
