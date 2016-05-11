Tester = require './shims/data-shim'


tester = new Tester()
onSequenceRetryClick = (data) -> console.log "Retrying Errored Sequence : #{data}"

sequence = new nanobox.SequenceViewer( $("body"), onSequenceRetryClick )

clear          = -> sequence.clearAllsequences()

window.trans1         = -> sequence.onStormpackUpdate [ tester.t1 ]
window.trans1b        = -> sequence.onStormpackUpdate [ tester.t1b ]
window.trans1Complete = -> sequence.onStormpackUpdate [ tester.t1Complete ]
window.trans1Partial  = -> sequence.onStormpackUpdate [ tester.t1Partial ]
window.trans2         = -> sequence.onStormpackUpdate [ tester.t2 ]
window.transBoth      = -> sequence.onStormpackUpdate [ tester.t2, tester.t1 ]
#
window.a              = -> sequence.onStormpackUpdate [ tester.startEmpty ]
window.b              = -> sequence.onStormpackUpdate [ tester.startComplete ]

trans1()
