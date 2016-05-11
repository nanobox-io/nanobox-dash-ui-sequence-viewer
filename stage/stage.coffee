Tester = require './shims/data-shim'


tester = new Tester()
onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"

sequence = new nanobox.SequenceViewer( $("body"), onSequenceRetryClick )

clear          = -> sequence.clearAllsequences()

window.simulateStormpackUpdate = (id)->
  sequence.onStormpackUpdate [ tester[id] ]

simulateStormpackUpdate 't1'
