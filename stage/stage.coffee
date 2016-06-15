Tester = require './shims/data-shim'


tester = new Tester()
onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"

sequence = new nanobox.SequenceViewer( $("#sequence-viewer"), onSequenceRetryClick )

clear = -> sequence.clearAllsequences()

window.simulateStormpackUpdate = (data)->
  sequence.onStormpackUpdate data

simulateStormpackUpdate [ tester.newStruct ]

# ------------------------------------ Stage UI

$('.stage-ui select').on 'change', (e)->
  val = $(e.currentTarget).val()
  if val == 'empty'
    simulateStormpackUpdate []
  else
    simulateStormpackUpdate [ tester[val] ]
