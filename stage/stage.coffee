Tester = require './shims/data-shim'

onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"

data =
  retryCb  : onSequenceRetryClick
  dashUrl  : "http://some.site/asdfion309ua93b3a"
  # isAbbrev : true

sequence = new nanobox.SequenceViewer( $("#sequence-viewer"), data )

clear = -> sequence.clearAllsequences()

window.simulateStormpackUpdate = (data)->
  sequence.refresh data

window.tester = new Tester()
tester.initUI '219'
