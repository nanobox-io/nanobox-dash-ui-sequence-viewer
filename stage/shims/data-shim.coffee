module.exports = class Tester

  ###
  View Classes:
    - root
       + Root level of a sequence
       + No progress bar
    - default
       +
    - component
    - componentInstance
  ###

  constructor: () ->
  newStruct :
    id : "abcdef12345-a"
    status : "sleeping"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : [
          id : "abcdef12345-d"
          status : "started"
          title : "Mesh"
          message : "activating platform service"
          estimate : "20000"
          viewClass : "instance"
          children : []
        ]
      ]
    ]

  newStruct4 :
    id : "abcdef12345-a"
    status : "running"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : [
          id : "abcdef12345-d"
          status : "started"
          title : "Mesh"
          message : "activating platform service"
          estimate : "20000"
          viewClass : "instance"
          children : [
            id : "abcdef12345-a"
            status : "sleeping"
            title : "App Activate"
            message : "Activating app by placing it on your selected provider."
            estimate : "20000"
            viewClass : "root"
            children : [
              id : "abcdef12345-b"
              status : "started"
              title : "asdf"
              message : "activating platform service"
              estimate : "200"
              children : [
                id : "abcdef12345-c"
                status : "resumed"
                title : "data.portal"
                message : "planning component"
                estimate : "20000"
                viewClass : "component"
                children : [
                  id : "abcdef12345-d"
                  status : "started"
                  title : "Mesh"
                  message : "activating platform service"
                  estimate : "20000"
                  viewClass : "instance"
                  children : [
                    id : "abcdef12345-a"
                    status : "sleeping"
                    title : "App Activate"
                    message : "Activating app by placing it on your selected provider."
                    estimate : "20000"
                    viewClass : "root"
                    children : [
                      id : "abcdef12345-b"
                      status : "started"
                      title : "asdf"
                      message : "activating platform service"
                      estimate : "200"
                      children : [
                        id : "abcdef12345-c"
                        status : "resumed"
                        title : "data.portal"
                        message : "planning component"
                        estimate : "20000"
                        viewClass : "component"
                        children : [
                          id : "abcdef12345-d"
                          status : "started"
                          title : "Mesh"
                          message : "activating platform service"
                          estimate : "20000"
                          viewClass : "instance"
                          children : []
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]

  newStruct2 :
    id : "abcdef12345-a"
    status : "brushing"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : [
      id : "abcdef12345-b"
      status : "started"
      title : "asdf"
      message : "activating platform service"
      estimate : "200"
      children : [
        id : "abcdef12345-c"
        status : "resumed"
        title : "data.portal"
        message : "planning component"
        estimate : "20000"
        viewClass : "component"
        children : []
      ]
    ]

  newStruct3 :
    id : "abcdef12345-a"
    status : "distracted"
    title : "App Activate"
    message : "Activating app by placing it on your selected provider."
    estimate : "20000"
    viewClass : "root"
    children : []

  newStruct5 :
    id       : "abcdef12345-a",
    status   : "curious",
    title    : "App Activate",
    message  : "Activating app by placing it on your selected provider.",
    estimate : "20000",
    children : [
      {
        id       : "abcdef12345-b",
        status   : "sleeping",
        title    : "mesh",
        message  : "activating platform service",
        estimate : "20000",
        children : [
          {
            id       : "abcdef12345-c",
            status   : "errored",
            title    : "data.portal",
            message  : "planning component",
            estimate : "20000",
            error    : {
              code    : 1002,
              doc     : "https://docs.nanobox.io/cloud/",
              summary : "Unable to communicate with AWS Servers",
              trace   : """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-view..."""
            }           ,
            children : [],
          }
        ],
      }
    ]

  t1 :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      true
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        "web1.2":
          message:  "provisioning servers"
          estimate:  50000
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
        database1:
          message:  "migrating data"
          estimate:  10000
        default:
          message:  "parsing Boxfile"
          estimate:  6000
    }

  t1Error1 :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      true
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        "web1.2":
          message:  "provisioning servers"
          estimate:  50000
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
          error:
            id:      "errorid12"
            code:    1002
            doc:    "https://docs.nanobox.io/cloud/"
            summary:  "Unable to communicate with AWS Servers"
            trace:    """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
[09:10:36] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
[09:10:36] coffee-script: recompiling... server/js/jade/sequence.js
[09:10:37] coffee-script: recompiling... server/js/jade/task.js
[09:10:37] coffee-script: recompiling... server/js/jade/sequence-error.js
[09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:10:37] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:10:37] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:11:41] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:11:53] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:13:14] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
[09:13:14] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:13:14] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:13:32] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
[09:13:32] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:13:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:13:47] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
[09:13:47] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:13:47] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:13:50] coffee-script: recompiling... app/coffee/components/sequence-error.coffee
[09:13:51] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:13:51] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
[09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
[09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
[09:15:00] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
[09:15:01] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
[09:15:02] coffee-script: recompiling... server/js/jade/sequence.js
[09:15:03] coffee-script: recompiling... server/js/jade/task.js
[09:15:03] coffee-script: recompiling... server/js/jade/sequence-error.js
[09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:15:03] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:15:03] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:16:24] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-error.js reloaded.
[09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
[09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
[09:18:06] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
[09:18:07] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
[09:18:07] coffee-script: recompiling... server/js/jade/sequence.js
[09:18:08] coffee-script: recompiling... server/js/jade/task.js
[09:18:08] coffee-script: recompiling... server/js/jade/sequence-error.js
[09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:18:08] coffeeify: app/coffee/main.coffee > app/coffee/main.js
[09:18:08] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:20] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:18:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded."""
        database1:
          message:  "migrating data"
          estimate:  10000
        default:
          message:  "parsing Boxfile"
          estimate:  6000
    }

  t1Error2 :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      true
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        "web1.2":
          message:  "provisioning servers"
          estimate:  50000
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
          error:
            id:      "errorid12"
            code:    1002
            doc:    "https://docs.nanobox.io/cloud/"
            summary:  "Unable to communicate with AWS Servers"
            trace:    """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
[09:10:36] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:20] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:18:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded."""
        database1:
          message:  "migrating data"
          estimate:  10000
          error:
            id:      "errorid12"
            code:    1002
            doc:    "https://docs.nanobox.io/cloud/"
            summary:  "Unable to communicate with AWS Servers"
            trace:    """[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence-wrapper.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/sequence.js reloaded.
[09:10:35] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/jade/task.js reloaded.
[09:10:36] coffee-script: recompiling... server/js/jade/sequence-wrapper.js
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:09] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/js/main.js reloaded.
[09:18:20] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded.
[09:18:32] /Users/Mark/web/nanobox/dashboard/components/sequence-viewer/server/css/main.css reloaded."""
        default:
          message:  "parsing Boxfile"
          estimate:  6000
    }

  t1b :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
        default:
          message:  "parsing Boxfile"
          estimate:  6000
        "web1.1":
          message:  "provisioning servers"
          estimate:  50000
        database1:
          message:  "migrating data"
          estimate:  10000
    }

  t1Complete :
    {
      id:           "t2"
      state:        "complete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
         default:
           message:  "parsing Boxfile"
           estimate:  6000
         web1:
           message:  "provisioning servers"
           estimate:  50000
         database1:
           message:  "migrating data"
           estimate:  10000
    }

  t1Partial :
    {
      id:           "t1"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T1 - Deploying Code"
      errored:      false
      summary:
        web1:
          message:  "provisioning servers"
          estimate:  50000
    }

  t2 :
    {
      id:           "t2"
      state:        "incomplete"
      status:       "running"
      description:  "Building app and deploying code"
      title:        "T2 - Deploying Code"
      errored:      false
      summary:
        default:
          message:  "parsing Boxfile"
          estimate:  6000
        web1:
          message:  "provisioning servers"
          estimate:  50000
        database1:
          message:  "migrating data"
          estimate:  10000
    }
  empty : {}

  # --------------------------------------------------------

  startEmpty :
    id:           "t1"
    state:        "incomplete"
    status:       "sleeping"
    description:  "Building app and deploying code"
    title:        "T1 - Deploying Code"
    errored:      false
    summary:      {}

  startComplete :
    id:           "t1"
    state:        "complete"
    status:       "sleeping"
    description:  "Building app and deploying code"
    title:        "T1 - Deploying Code"
    errored:      false
    summary:      {}
