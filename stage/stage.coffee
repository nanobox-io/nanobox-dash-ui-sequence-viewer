Tester = require './shims/data-shim'
tester = new Tester()
transactor = new nanobox.SequenceViewer( $("body") )

clear          = -> transactor.clearAllTransactions()

trans1         = -> transactor.onStormpackUpdate [ tester.t1 ]
trans1b        = -> transactor.onStormpackUpdate [ tester.t1b ]
trans1Complete = -> transactor.onStormpackUpdate [ tester.t1Complete ]
trans1Partial  = -> transactor.onStormpackUpdate [ tester.t1Partial ]
trans2         = -> transactor.onStormpackUpdate [ tester.t2 ]
transBoth      = -> transactor.onStormpackUpdate [ tester.t2, tester.t1 ]
#
a              = -> transactor.onStormpackUpdate [ tester.startEmpty ]
b              = -> transactor.onStormpackUpdate [ tester.startComplete ]


trans1()
